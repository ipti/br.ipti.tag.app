import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

const _urlWebSocket = "http://192.168.2.1:5000";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tag Kitchen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const KitchenPage(),
    );
  }
}

class KitchenPage extends StatefulWidget {
  const KitchenPage({super.key});

  @override
  State<KitchenPage> createState() => _KitchenPageState();
}

class _KitchenPageState extends State<KitchenPage> {
  int _studentsCounter = 0;
  final dio = Dio();

  void connectAndListen() {
    socket = IO.io(
        _urlWebSocket,
        IO.OptionBuilder()
            .enableReconnection()
            .setPath('/socket.io')
            .enableForceNew()
            .setTimeout(300)
            .enableForceNewConnection()
            .setExtraHeaders({
          'Connection': 'Upgrade',
          'Origin': _urlWebSocket,
        }).setTransports(['websocket']).build());

    socket.on('message', (data) => (data['event'] == 'INCREMENTCOUNTER') ? _incrementCounter() : null);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    socket = IO.io(
        _urlWebSocket,
        IO.OptionBuilder()
            .enableReconnection()
            .setPath('/socket.io')
            .enableForceNew()
            .setTimeout(300)
            .enableForceNewConnection()
            .setExtraHeaders({
          'Connection': 'Upgrade',
          'Origin': _urlWebSocket,
        }).setTransports(['websocket']).build());
    connectAndListen();
  }

  late IO.Socket socket;

  void _incrementCounter() {
    setState(() => _studentsCounter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Alunos presentes hoje:", style: TextStyle(fontSize: 40)),
            Text('$_studentsCounter', style: const TextStyle(fontSize: 80)),
          ],
        ),
      ),
    );
  }
}
