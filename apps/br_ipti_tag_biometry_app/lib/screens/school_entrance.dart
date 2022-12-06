import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:br_ipti_tag_biometry_app/widgets/school_panel.dart';
import 'package:br_ipti_tag_biometry_app/widgets/student_info.dart';
import 'package:br_ipti_tag_biometry_app/widgets/waiting_biometrics.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

class SchoolEntrance extends StatefulWidget {
  const SchoolEntrance({super.key});

  @override
  State<SchoolEntrance> createState() => _SchoolEntrancePageState();
}

class _SchoolEntrancePageState extends State<SchoolEntrance> {
  final biometricsService = BiometricsService();
  String mensage = '';
  var identification;
  @override
  void initState() {
    super.initState();
    biometricsService.connectAndListen();
    biometricsService.streamSocket.getResponse.listen((data) {
      if (data != null) {
        if (data['id'] == 202) {
          identification = data['id_finger'];
        }
        if (data['id'] == 502) {
          mensage = data['info'].toString();
        }
      }
    });
    biometricsService.emit("message", "SearchSendMessage");
  }

  final mapBioStudent = {50: 2};
  final user = [
    {'name': 'jonny', 'turma': '3A', 'id': '1'},
    {'name': 'Igor', 'turma': '3B', 'id': '50'},
  ];

  @override
  Widget build(BuildContext context) {
    mapBioStudent[50];
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SchoolPanel(),
            StreamBuilder<Map?>(
              stream: biometricsService.streamSocket.getResponse,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(snapshot.data?['info']),
                      ),
                      if (snapshot.data?['id'] == 101)
                        const WaitingBiometrics(),
                      if (snapshot.data?['id'] == 202) const StudentInfo(),
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
