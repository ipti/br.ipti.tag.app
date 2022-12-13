import 'dart:async';
import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class BiometricsService {
  final _urlWebSocket = "http://192.168.15.28:5000";

  StreamSocket streamSocket = StreamSocket();
  late IO.Socket socket;

  void connectAndListen() {
    socket = IO.io(
        _urlWebSocket,
        IO.OptionBuilder()
            .enableReconnection()
            .setPath('/socket.io')
            .enableForceNew()
            .enableForceNewConnection()
            .setExtraHeaders(
                {'Connection': 'Upgrade', 'Origin': '127.0.0.1'}) // optional
            .setTransports(['websocket']).build());

    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });

    //When an event recieved from server, data is added to the stream
    socket.onAny((event, data) {
      streamSocket.addResponse(data);
    });
    socket.onDisconnect((_) => log('disconnect'));
  }

  void emit(event, data) {
    socket.emit(event, data);
  }
}

class StreamSocket {
  final _socketResponse = StreamController<Map?>.broadcast();

  void Function(Map?) get addResponse => _socketResponse.sink.add;

  Stream<Map?> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}
