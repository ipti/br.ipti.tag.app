import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:br_ipti_tag_biometry_app/widgets/school_panel.dart';
import 'package:br_ipti_tag_biometry_app/widgets/student_info.dart';
import 'package:flutter/material.dart';

class SchoolEntrance extends StatefulWidget {
  const SchoolEntrance({super.key});

  @override
  State<SchoolEntrance> createState() => _SchoolEntrancePageState();
}

class _SchoolEntrancePageState extends State<SchoolEntrance> {
  final biometricsService = BiometricsService();

  @override
  void initState() {
    super.initState();
    biometricsService.connectAndListen();
    biometricsService.streamSocket.getResponse.listen((event) {
      log(event);
    });
    biometricsService.emit("message", "SearchSendMessage");
  }

  final mapBioStudent = {50: 2};
  @override
  Widget build(BuildContext context) {
    mapBioStudent[50];
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SchoolPanel(),
            StreamBuilder<String>(
              stream: biometricsService.streamSocket.getResponse,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.data ?? "empty"),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            const StudentInfo(),
          ],
        ),
      ),
    );
  }
}
