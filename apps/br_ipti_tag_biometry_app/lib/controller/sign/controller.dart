import 'dart:async';
import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/controller/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';

class ControllerSign {
  final BiometricsService biometricsService;
  final _socketResponse = StreamController<BioEvents>.broadcast();

  ControllerSign(this.biometricsService);

  void Function(BioEvents) get addResponse => _socketResponse.sink.add;

  Stream<BioEvents> get getResponseEvents => _socketResponse.stream;

  var userIdentification = {};
  void dateBiometrics() {
    biometricsService.connectAndListen();

    biometricsService.streamSocket.getResponse.listen((data) {
      if (data != null) {
        addResponse(BioEvents.byCode(data['id']));
      }
    });
    // biometricsService.emit("message", "SearchSendMessage");
    final mape = {for (int i = 0; i < 150; i++) i: ""};
    mape.keys.where((element) => mape[element] == "");
  }
}
