import 'dart:async';
import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/core/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/services/local_storage_service.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ControllerIdentification implements Disposable {
  final BiometricsService _biometricsService;
  final LocalStorageService _localStorageService;

  final blocStream = StreamController<BioEvents>.broadcast();

  ControllerIdentification(this._biometricsService, this._localStorageService);

  void Function(BioEvents) get addResponse => blocStream.sink.add;

  Stream<BioEvents> get getResponseEvents => blocStream.stream;

  var userIdentification = <String, dynamic>{};

  void startIdentification() {
    _biometricsService.connectAndListen();
    _biometricsService.emit("message", "SearchSendMessage");
    addResponse(BioEvents.waiting);
  }

  void deleteAllFinger() {
    _biometricsService.emit("message", 'ClearSendMessage');
  }

  void dateBiometrics() {
    final user = [
      {
        'name': 'jonny',
        'turma': '3A',
        'id': '1',
        'id_finger': 50,
        'img':
            'https://images.suamusica.com.br/ehQJ5PRLM5_B6G56VmLuTigVsTU=/240x240/filters:format(webp)/49091608/3331189/cd_cover.jpg'
      },
      {
        'name': 'Walker',
        'turma': '2B',
        'id': '1',
        'id_finger': 77,
        'img':
            'https://images.suamusica.com.br/ehQJ5PRLM5_B6G56VmLuTigVsTU=/240x240/filters:format(webp)/49091608/3331189/cd_cover.jpg'
      },
      {'name': 'Igor', 'turma': '3B', 'id': '50'},
    ];

    _biometricsService.streamSocket.getResponse.listen((data) {
      if (data != null) {
        log(data['id'].toString());
        if (data['id'] == BioEvents.waitingFinger.code) {
          addResponse(BioEvents.waitingFinger);
        } else if (data['id'] == BioEvents.fingerDected.code) {
          addResponse(BioEvents.fingerDected);
          _localStorageService.findStudent(data['id_finger']);

          Timer(
              const Duration(seconds: 4),
              () => {
                    _biometricsService.emit(
                      "message",
                      "SearchSendMessage",
                    ),
                    addResponse(BioEvents.waiting)
                  });
        } else if (data['id'] == BioEvents.fingerNotFound.code) {
          addResponse(BioEvents.fingerNotFound);
          Timer(
              const Duration(seconds: 2),
              () => {
                    _biometricsService.emit("message", "SearchSendMessage"),
                    addResponse(BioEvents.waiting)
                  });
        } else {
          addResponse(BioEvents.byCode(data['id']));
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
