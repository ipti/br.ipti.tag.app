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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        }) // optional
            .setTransports(['websocket']).build());

    socket.onConnect((_) {
      print('connected');
    });

    socket.onAny((event, data) => print("Event: $event, Data: $data"));

    socket.on('message', (data) => {if (data['event'] == 'INCREMENTCOUNTER') _incrementCounter()});
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
        }) // optional
            .setTransports(['websocket']).build());
    connectAndListen();
  }

  late IO.Socket socket;


  void _incrementCounter() {
    setState(() {
      _studentsCounter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Alunos presentes hoje:",
                style: TextStyle(fontSize: 40)),
            Text('$_studentsCounter', style: TextStyle(fontSize: 80)),
          ],
        ),
      ),
    );
  }
}
