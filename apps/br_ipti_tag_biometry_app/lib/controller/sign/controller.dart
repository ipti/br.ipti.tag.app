import 'dart:async';

import 'package:br_ipti_tag_biometry_app/controller/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';

class ControllerSign {
  final BiometricsService _biometricsService;
  final _socketResponse = StreamController<BioEvents>.broadcast();

  ControllerSign(this._biometricsService);

  void Function(BioEvents) get addResponse => _socketResponse.sink.add;

  Stream<BioEvents> get getResponseEvents => _socketResponse.stream;

  void startSign() {
    _biometricsService.emit('message', 'StoreSendMessage');
    _biometricsService.emit("IdStore", 90);
    print('sdaadsjn');
  }

  void dateBiometrics() {
    _biometricsService.connectAndListen();

    _biometricsService.streamSocket.getResponse.listen((data) {
      if (data != null) {
        addResponse(BioEvents.byCode(data['id']));
      }
    });
    final mape = {for (int i = 0; i < 150; i++) i: ""};
    mape.keys.where((element) => mape[element] == "");
  }
}
