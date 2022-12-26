import 'dart:async';
import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/core/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/sign_state.dart';
import 'package:br_ipti_tag_biometry_app/services/local_storage_service.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ControllerIdentification implements Disposable {
  final BiometricsService _biometricsService;
  final LocalStorageService _localStorageService;
final stateSignStream = StreamController<SignState>.broadcast();
  final blocStream = StreamController<BioEvents>.broadcast();

  ControllerIdentification(this._biometricsService, this._localStorageService);


  SignState currentState = const SignState(null, BioEvents.waiting);

  void Function(SignState) get addSignResponse => stateSignStream.sink.add;

  Stream<SignState> get getResponseSign => stateSignStream.stream;

  void startIdentification() {
     addSignResponse(currentState.copyWith(event: BioEvents.waiting));
    _biometricsService.connectAndListen();
    _biometricsService.emit("message", "SearchSendMessage");
  }

  void deleteAllFinger() {
    _biometricsService.emit("message", 'ClearSendMessage');
  }

  void dateBiometrics() {
  
    _biometricsService.streamSocket.getResponse.listen((data) async {
      if (data != null) {
        log(data['id'].toString());
        if (data['id'] == BioEvents.waitingFinger.code) {
           addSignResponse(currentState.copyWith(event: BioEvents.waitingFinger));
        } else if (data['id'] == BioEvents.fingerDected.code) {
          addSignResponse(currentState.copyWith(event: BioEvents.fingerDected, student: await _localStorageService.findStudent(data['id_finger'])));
          Timer(
              const Duration(seconds: 4),
              () => {
                    _biometricsService.emit(
                      "message",
                      "SearchSendMessage",
                    ),
                     addSignResponse(currentState.copyWith(event: BioEvents.waiting))
                  });
        } else if (data['id'] == BioEvents.fingerNotFound.code) {
           addSignResponse(currentState.copyWith(event: BioEvents.fingerNotFound));
          Timer(
              const Duration(seconds: 2),
              () => {
                    _biometricsService.emit("message", "SearchSendMessage"),
                    addSignResponse(currentState.copyWith(event: BioEvents.waiting))
                  });
        } else {
           addSignResponse(currentState.copyWith(event: BioEvents.byCode(data['id'])));
        }
      }
    });
    // biometricsService.emit("message", "SearchSendMessage");
    final mape = {for (int i = 0; i < 150; i++) i: ""};
    mape.keys.where((element) => mape[element] == "");
  }

  @override
  void dispose() {
    log("DISPOSE CONTROLLER");
    blocStream.close();
    _biometricsService.dispose();
  }
}
