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
    _biometricsService.socket.dispose();
    _biometricsService.connect();
    addSignResponse(currentState.copyWith(event: BioEvents.waiting));
    // _biometricsService.connect();
    _biometricsService.connectAndListen();
 _biometricsService.emit("message", "SearchSendMessage");
    // _biometricsService.emit("message", "SearchSendMessage");
  }




  void restart() {
    _biometricsService.disconnect();
     addSignResponse(currentState.copyWith(event: BioEvents.waiting));
    _biometricsService.connect();
    // _biometricsService.emit("message", "SearchSendMessage");
  }

  void deleteAllFinger() {
    _biometricsService.emit("message", 'ClearSendMessage');
  }

  bool timeout() {
    return _biometricsService.socket.connected;
  }

  void dateBiometrics() {
    _biometricsService.streamSocket.getResponse.listen((state) async {
      final data = state["data"];
      if (state["event"] == "connect") {
        addSignResponse(
                  currentState.copyWith(event: BioEvents.waiting));
      }
      log(data.toString());
      if (data != null) {
        if (data['id'] == BioEvents.waitingFinger.code) {
          addSignResponse(
              currentState.copyWith(event: BioEvents.waitingFinger));
        } else if (data['id'] == BioEvents.fingerDected.code) {
          try {
            final student = await _localStorageService.findStudent(
              data['id_finger'],
            );
            if (student != null) {
              addSignResponse(
                currentState.copyWith(
                  event: BioEvents.fingerDected,
                  student: student,
                ),
              );
              
            } else {
              addSignResponse(
                  currentState.copyWith(event: BioEvents.fingerNotFound));
            }
          } catch (e) {
            stateSignStream.sink.addError(Exception('Aluno não encontrado'));
          }

         
        } else if (data['id'] == BioEvents.fingerNotFound.code) {
          addSignResponse(
              currentState.copyWith(event: BioEvents.fingerNotFound));
        
        } else {
          addSignResponse(
              currentState.copyWith(event: BioEvents.byCode(data['id'])));
        }
      }
    });
  }

  @override
  void dispose() {
    log("DISPOSE CONTROLLER");
    blocStream.close();
    _biometricsService.dispose();
  }
}
