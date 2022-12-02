import 'dart:developer';
import 'dart:io';

import 'package:br_ipti_tag_biometry_app/Screens/school_entrance.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/foundation.dart' show kIsWeb;

String urlWebSocket = "http://localhost:5000";
String urlWebSocketMobile = "wss//localhost:5000";
IO.Socket? socket;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      var uri = kIsWeb ? urlWebSocket : urlWebSocketMobile;
      socket = IO.io(uri);
      log(uri);
      socket!.onConnectError((data) => log(data.toString()));
      socket!.onConnect((_) {
        // it firing 'join' event so that server can listen the request.
      });
    } catch (e) {
      log(e.toString());
      log('message');
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
