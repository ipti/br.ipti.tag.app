import 'dart:async';
import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/core/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/sign_state.dart';
import 'package:br_ipti_tag_biometry_app/services/local_storage_service.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../../../student/domain/usecases/load_student_usecase.dart';

class ControllerSign {
  final BiometricsService biometricsService;
  final AuthRepository authRepository;
  final LoadStudentUsecase loadStudentUsecase;
  final LocalStorageService localStorageService;

  final stateSignStream = StreamController<SignState>.broadcast();
  late StudentIdentification studentCache;

  ControllerSign({
    required this.localStorageService,
    required this.biometricsService,
    required this.authRepository,
    required this.loadStudentUsecase,
  });

  SignState currentState = const SignState(null, BioEvents.putfinger);

  void Function(SignState) get addSignResponse => stateSignStream.sink.add;

  Stream<SignState> get getResponseSign => stateSignStream.stream;

  Future<void> fetchStudent(studentId) async {
    final maybeCurrentSchool = await authRepository.getCurrentUserSchools();
    final currentSchool = maybeCurrentSchool.fold(
      (l) => throw l,
      (r) => r.first,
    );

    final student = await loadStudentUsecase.call(
      LoadStudentParams(
        studentId,
        currentSchool.inepId,
      ),
    );

    student.fold(
      (error) => log("erro: ${error.message}"),
      (data) => {addSignResponse(currentState.copyWith(student: data, event: BioEvents.putfinger))},
    );
  }

  void connect() {
    biometricsService.connect();
  }

  void disconnect(){
    biometricsService.disconnect();
    biometricsService.dispose();
  }

  void restart() {
    biometricsService.socket.on('SearchSendMessage', (data) => null);
    //biometricsService.connect();
  }

  Future init() async {
    biometricsService.connectAndListen();
    stateSignStream.stream.listen((event) {
      currentState = event;
    });
  }

  Future startSign() async {
    addSignResponse(currentState.copyWith(event: BioEvents.putfinger));
    final idStore = await localStorageService.idStore();
    biometricsService.emit('IdStore', idStore);
  }

  void deleteFinger() {
    biometricsService.emit('IdDelete', 77);
  }

  Future deleteAllFinger() async {
    await localStorageService.deleteAll();
    biometricsService.emit("ClearSendMessage", 'message');
  }

  int lastEventId = 0;

  void dateBiometrics(state) async {
    final data = state["data"];
    if (state["event"] == "connect") {
      addSignResponse(currentState.copyWith(event: BioEvents.waiting));
    }
    if (data != null) {
      if (data == 'timeout' || data['id'] != 200 || data['id'] == lastEventId) {
        addSignResponse(currentState.copyWith(event: BioEvents.byCode(data["id"])));
        return;
      }

      if (data['id'] == 200) addSignResponse(currentState.copyWith(event: BioEvents.storeok));

      if (currentState.student != null) {
        localStorageService.addStudentWithBiometricId(student: currentState.student!);
        disconnect();
      }
    }
  }
}
