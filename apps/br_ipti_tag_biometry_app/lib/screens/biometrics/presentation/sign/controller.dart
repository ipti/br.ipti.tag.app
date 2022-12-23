import 'dart:async';
import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/core/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/sign_state.dart';
import 'package:br_ipti_tag_biometry_app/services/local_storage_service.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:tag_sdk/tag_sdk.dart';

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

  SignState currentState = const SignState(null, BioEvents.waiting);

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
      (error) => log(error.message),
      (data) => {addSignResponse(currentState.copyWith(student: data))},
    );
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
    final idStore = await localStorageService.IdStore();
    biometricsService.emit('IdStore', idStore);
  }

  void deleteFinger() {
    biometricsService.emit('IdDelete', 77);
  }

  void deleteAllFinger() {
    biometricsService.emit("ClearSendMessage", 'mensage');
  }

  void dateBiometrics(data) async {
    if (data != null) {
      if (data['id'] == 200) {
        addSignResponse(currentState.copyWith(event: BioEvents.storeok));

        if (currentState.student != null) {
          localStorageService.addStudentWithBiometricId(
              student: currentState.student!);
        }
      } else {
        addSignResponse(
            currentState.copyWith(event: BioEvents.byCode(data["id"])));
      }
    }
  }
}
