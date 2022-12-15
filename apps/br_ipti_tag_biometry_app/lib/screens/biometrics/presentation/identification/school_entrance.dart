import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:br_ipti_tag_biometry_app/controller/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/controller/identification/controller.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/biometrics_sign.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:br_ipti_tag_biometry_app/widgets/finger_mensage.dart';
import 'package:br_ipti_tag_biometry_app/widgets/school_panel.dart';
import 'package:br_ipti_tag_biometry_app/widgets/student_info.dart';
import 'package:br_ipti_tag_biometry_app/widgets/waiting_biometrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'dart:convert';

import 'package:tag_ui/tag_ui.dart';

class SchoolEntrance extends StatefulWidget {
  const SchoolEntrance({super.key});

  @override
  State<SchoolEntrance> createState() => _SchoolEntrancePageState();
}

class _SchoolEntrancePageState extends State<SchoolEntrance> {
  final biometricsController = Modular.get<ControllerIdentification>();

  @override
  void initState() {
    super.initState();
    biometricsController.dateBiometrics();

    biometricsController.startIdentification();
  }

  // @override
  // void dispose() {
  //   biometricsController.

  //   super.dispose();
  // }

  final mapBioStudent = {50: 2};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SchoolPanel(),
            StreamBuilder<BioEvents?>(
              stream: biometricsController.getResponseEvents,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    if (snapshot.data == BioEvents.waiting)
                      const WaitingBiometrics(),
                    if (snapshot.data?.code == 102)
                      FingerMensage(text: snapshot.data!.info),
                    if (snapshot.data?.code == 104)
                      FingerMensage(text: snapshot.data!.info),
                    if (snapshot.data?.code == 202)
                      StudentInfo(
                          student: biometricsController.userIdentification),
                    if (snapshot.data?.code == 502)
                      FingerMensage(text: snapshot.data!.info),
                  ],
                );
              },
            ),
            TagButton(
              text: 'Cadastrar Biometria',
              onPressed: () {
                Modular.to.pushReplacementNamed("students");
              },
            ),
            TagButton(
              text: 'Sair',
              onPressed: () {
                final usecase = Modular.get<LogoutUsecase>();
                usecase.call(EmptyParams());
                Modular.to.pushNamed("/");
              },
            )
          ],
        ),
      ),
    );
  }
}
