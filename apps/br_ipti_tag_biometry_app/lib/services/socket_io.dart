import 'dart:async';
import 'dart:developer';


import 'package:flutter_modular/flutter_modular.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class BiometricsService implements Disposable {
  final StreamSocket streamSocket;
  final io.Socket socket;

  BiometricsService(this.streamSocket, this.socket);

  void connect() {
    socket.connect();
  }

  void disconnect() {
    socket.disconnect();
  }

  void clearListen() {
    socket.clearListeners();
  }

  void connectAndListen() {
    socket.onConnect((_) {
      log('connect');
    });

    socket.onError((data) => log(data));
    //When an event recieved from server, data is added to the stream
    socket.onAny((event, data) {
      log('RECEIVED | event $event with data: ${data.toString()}');
      streamSocket.addResponse({"event": event, "data": data});
    });
    socket.onDisconnect((_) => log('disconnect'));
  }

  void emit(event, data) {
    log("EMIT | event $event with data: ${data.toString()}");
    socket.emit(event, data);
  }

  @override
  void dispose() {
    socket.clearListeners();
    streamSocket.dispose();
    log("DISPOSE socket");
  }
}

class StreamSocket {
  final _socketResponse = StreamController<Map>.broadcast();

  void Function(Map) get addResponse => _socketResponse.sink.add;

  Stream<Map> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}
