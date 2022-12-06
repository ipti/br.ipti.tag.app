import 'dart:async';

import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';

enum BioEvents {
  waiting(code: 101);

  const BioEvents({
    required this.code,
  });

  final int code;
}

class ControllerBiometrics {
  final biometricsService = BiometricsService();
  final _socketResponse = StreamController<BioEvents>.broadcast();

  void Function(BioEvents) get addResponse => _socketResponse.sink.add;

  Stream<BioEvents> get getResponse => _socketResponse.stream;

  String mensage = '';
  void dateBiometrics() {
    biometricsService.connectAndListen();
    biometricsService.streamSocket.getResponse.listen((data) {
      addResponse(BioEvents.waiting);
      if (data != null) {
        if (data['id'] == 202) {}
        if (data['id'] == 502) {
          mensage = data['info'].toString();
        }
      }
    });
    biometricsService.emit("message", "SearchSendMessage");
  }
}
