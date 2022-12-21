import 'dart:async';

import 'package:br_ipti_tag_biometry_app/core/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/services/local_storage_service.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:tag_sdk/tag_sdk.dart';

class ControllerSign {
  final BiometricsService biometricsService;
  final AuthRepository authRepository;
  final LoadStudentUsecase loadStudentUsecase;
  final LocalStorageService localStorageService;
  final bioEventStream = StreamController<BioEvents>.broadcast();
  final studentStream = StreamController<StudentIdentification>.broadcast();
  late StudentIdentification studentCache;
  ControllerSign({
    required this.localStorageService,
    required this.biometricsService,
    required this.authRepository,
    required this.loadStudentUsecase,
  });

  void Function(BioEvents) get addResponse => bioEventStream.sink.add;

  Stream<BioEvents> get getResponseEvents => bioEventStream.stream;

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
      (l) => studentStream.sink.addError(l),
      (r) => studentStream.sink.add(r),
    );
  }

  void restart() {
    biometricsService.socket.on('SearchSendMessage', (data) => null);
    //biometricsService.connect();
  }

  Future startSign() async {
    biometricsService.connectAndListen();
    studentStream.stream.listen((event) {
      studentCache = event;
    });

    final idStore = await localStorageService.IdStore();
    biometricsService.emit('IdStore', idStore);
  }

  void deleteFinger() {
    biometricsService.emit('IdDelete', 77);
  }

  void deleteAllFinger() {
    biometricsService.emit("ClearSendMessage", 'mensage');
  }

  void dateBiometrics() async {
    biometricsService.streamSocket.getResponse.listen((data) async {
      if (data != null) {
        if (data['id'] == 200) {
          addResponse(BioEvents.storeok);

          await localStorageService.addStudentWithBiometricId(
              student: studentCache);
        } else {
          addResponse(BioEvents.byCode(data['id']));
        }
      }
    });
    final mape = {for (int i = 0; i < 150; i++) i: ""};
    mape.keys.where((element) => mape[element] == "");
  }
}
