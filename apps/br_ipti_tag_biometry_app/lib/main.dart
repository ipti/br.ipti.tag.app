import 'dart:developer';
import 'dart:io';

import 'package:br_ipti_tag_biometry_app/Screens/school_entrance.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      var socket = IO.io('ws://localhost:5000', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
      });
      socket.on('connect', (_) {
        log('connect');
        socket.emit('msg', 'test');
      });
      socket.on("connecting", (data) => log('connecting'));
      socket.on('connect_error', (data) {
        log(data.toString());
        socket.emit('msg', 'test');
      });
      // IO.Socket socket = IO.io('http://localhost:5000', <String, dynamic>{
      //   "transports": ["websocket"],
      //   "autoConnect": false,
      // });
      // socket.connect();
      // log(socket.connected.toString());
      // socket.onConnectError((data) => log(data.toString()));
      // socket.emit('message', 'StoreSendMessage');
    } catch (e) {
      log(e.toString());
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: Scaffold(body: SafeArea(child: TicketsPage())),
        title: 'Biometria',
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => SchoolEntrance(),
        });
  }
}
