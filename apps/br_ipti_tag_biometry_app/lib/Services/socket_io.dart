import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as IO;

main() {
  // Dart client
  IO.Socket socket = IO.io('http://127.0.0.1:5000');
  socket.onConnect((_) {
    log('connect');
    socket.emit('msg', 'test');
  });
  socket.on('event', (data) => log(data));
  socket.onDisconnect((_) => log('disconnect'));
  socket.on('fromServer', (_) => log(_));
}
