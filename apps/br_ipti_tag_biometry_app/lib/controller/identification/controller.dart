import 'dart:async';
import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/controller/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ControllerIdentification extends ChangeNotifier implements Disposable {
  final BiometricsService _biometricsService;

  final blocStream = StreamController<BioEvents>.broadcast();

  ControllerIdentification(this._biometricsService);

  void Function(BioEvents) get addResponse => blocStream.sink.add;

  Stream<BioEvents> get getResponseEvents => blocStream.stream;

  var userIdentification = {};

  void startIdentification() {
    _biometricsService.connectAndListen();
    _biometricsService.emit("message", "SearchSendMessage");
  }

  void dateBiometrics() {
    final user = [
      {
        'name': 'jonny',
        'turma': '3A',
        'id': '1',
        'id_finger': 80,
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
        if (data['id'] == BioEvents.waitingFinger.code) {
          addResponse(BioEvents.waitingFinger);
        } else if (data['id'] == BioEvents.fingerDected.code) {
          addResponse(BioEvents.fingerDected);
          for (int i = 0; i < user.length; i++) {
            if (user[i]['id_finger'] == data['id_finger']) {
              userIdentification = user[i];
            }
          }
          Timer(const Duration(seconds: 4),
              () => _biometricsService.emit("message", "SearchSendMessage"));
        } else if (data['id'] == BioEvents.fingerNotFound.code) {
          addResponse(BioEvents.fingerNotFound);
          Timer(const Duration(seconds: 2),
              () => _biometricsService.emit("message", "SearchSendMessage"));
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
    _biometricsService.off('SearchSendMessage', 'message');
    _biometricsService.dispose();
  }
}
