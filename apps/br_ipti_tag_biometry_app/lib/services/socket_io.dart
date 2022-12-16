import 'dart:async';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class BiometricsService implements Disposable {
  final StreamSocket streamSocket;
  final IO.Socket socket;

  BiometricsService(this.streamSocket, this.socket);

  void connectAndListen() {
    socket.onConnect((_) {
      print('connect');
    });

    //When an event recieved from server, data is added to the stream
    socket.onAny((event, data) {
      streamSocket.addResponse(data);
    });

    socket.onDisconnect((_) => log('disconnect'));
  }

  void send(event) {
    log("EMIT | event $event}");
    socket.send(event);
  }

  void emit(event, data) {
    log("EMIT | event $event with data: ${data.toString()}");
    // log(data.toString());
    socket.emit(event, data);
  }

  @override
  void dispose() {
    streamSocket.dispose();
  }
}

class StreamSocket {
  final _socketResponse = StreamController<Map?>.broadcast();

  void Function(Map?) get addResponse => _socketResponse.sink.add;

  Stream<Map?> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.stream.drain().then((value) => _socketResponse.close());
  }
}
