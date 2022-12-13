import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/controller/controller.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:br_ipti_tag_biometry_app/widgets/finger_mensage.dart';
import 'package:br_ipti_tag_biometry_app/widgets/school_panel.dart';
import 'package:br_ipti_tag_biometry_app/widgets/student_info.dart';
import 'package:br_ipti_tag_biometry_app/widgets/waiting_biometrics.dart';
import 'package:flutter/material.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'dart:convert';

import 'package:tag_ui/tag_ui.dart';

class BiometricsSign extends StatefulWidget {
  const BiometricsSign({super.key, required this.student});

  final StudentIdentification student;

  @override
  State<BiometricsSign> createState() => _BiometricsSignPageState();
}

class _BiometricsSignPageState extends State<BiometricsSign> {
  final biometricsService = BiometricsService();
  final biometricsController = ControllerBiometrics();

  @override
  void initState() {
    super.initState();
    biometricsController.dateBiometrics();

    log(biometricsController.getResponseEvents.hashCode.toString());
    biometricsService.streamSocket.getResponse.listen((data) {
      log(data!['id'].toString());
      log(data['info'].toString());
    });
    biometricsService.connectAndListen();
    biometricsService.emit('IdStore', 88);
  }

  final mapBioStudent = {50: 2};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const TagAppBar(),
            Text(widget.student.name),
            const Text('Foto do Aluno'),
            Container(
              height: 256.0,
              width: 256.0,
              decoration: const BoxDecoration(
                color: TagColors.colorBaseCloudDark,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: FittedBox(
                child: Image.network(
                    'https://images.suamusica.com.br/ehQJ5PRLM5_B6G56VmLuTigVsTU=/240x240/filters:format(webp)/49091608/3331189/cd_cover.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            StreamBuilder<BioEvents?>(
              stream: biometricsController.getResponseEvents,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    if (snapshot.data?.code == 101) const WaitingBiometrics(),
                    if (snapshot.data?.code == 102)
                      FingerMensage(text: snapshot.data!.info),
                    if (snapshot.data?.code == 104)
                      FingerMensage(text: snapshot.data!.info),
                    if (snapshot.data?.code == 105)
                      FingerMensage(text: snapshot.data!.info),

                    if (snapshot.data?.code == 108)
                      FingerMensage(text: snapshot.data!.info),
                    // if (snapshot.data?.code == 202) const StudentInfo(),
                    if (snapshot.data?.code == 502)
                      FingerMensage(text: snapshot.data!.info),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
