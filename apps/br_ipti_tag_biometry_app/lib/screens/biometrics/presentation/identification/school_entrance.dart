import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/core/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/identification/controller.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/sign_state.dart';
import 'package:br_ipti_tag_biometry_app/widgets/finger_mensage.dart';
import 'package:br_ipti_tag_biometry_app/widgets/school_panel.dart';
import 'package:br_ipti_tag_biometry_app/widgets/student_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../../../constants.dart';
import '../../../auth/domain/usecases/logout_usecase.dart';

class SchoolEntrance extends StatefulWidget {
  const SchoolEntrance({super.key});

  @override
  State<SchoolEntrance> createState() => _SchoolEntrancePageState();
}

class _SchoolEntrancePageState extends State<SchoolEntrance> {
  final biometricsController = Modular.get<ControllerIdentification>();

  @override
  void dispose() {
    biometricsController.dispose();
    super.dispose();
  }

  Future<void> fingerprintPressed() async {
    try {
      Dio dio = Dio()..options.baseUrl = "$BASEURL:5000";
      Response response = await dio.get("/increment-counter");
      log(response.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Widget studentData = Container();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const SchoolPanel(),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TagButton(
                      text: 'Identificar Biometria',
                      onPressed: (() => {
                            biometricsController.restart(),
                            biometricsController.startIdentification(),
                            biometricsController.dateBiometrics(),
                          })),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TagButton(
                      text: 'Cancelar busca',
                      onPressed: (() => {
                            biometricsController.restart(),
                            biometricsController.cancelIdentification(),
                          })),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TagButton(
                    text: 'Cadastrar Biometria',
                    onPressed: () {
                      biometricsController.restart();
                      biometricsController.cancelIdentification();
                      Modular.to.pushReplacementNamed("/biometrics/students/");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TagButton(
                    text: 'Sair',
                    onPressed: () {
                      final usecase = Modular.get<LogoutUsecase>();
                      usecase.call(EmptyParams());
                      Modular.to.pushNamed("/");
                    },
                  ),
                ),
              ],
            ),
            StreamBuilder<SignState?>(
              stream: biometricsController.stateSignStream.stream,
              builder: (context, snapshot) {
                print("SNAPSHOT: ${snapshot.data}");
                if(snapshot.data == null) return Container();
                if (snapshot.data?.event == BioEvents.passverify) return studentData;
                switch (snapshot.data?.event) {
                  case BioEvents.fingerDected:
                    fingerprintPressed();
                    studentData = StudentInfo(student: snapshot.data!.student);
                    return studentData;
                  default:
                    return FingerMensage(text: snapshot.data!.event.info, code: snapshot.data?.event.code);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
