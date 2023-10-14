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

  Future<void> fingerprintPressed(int id) async {
    if (id == 0) return;
    try {
      Dio dio = Dio()..options.baseUrl = "$BASEURL:5000";
      Response response = await dio.get("/increment-counter");
      log(response.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Widget child = Container();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              Dio dio1 = Dio()..options.baseUrl = "http://192.168.2.1:5000";
              Response response = await dio1.get("/increment-counter");
              print(response.statusCode);
              print(response.data);
            } on DioError catch (e) {
              print("ERRO: ${e.message}");
            }
          },
        ),
        body: Column(
          children: [
            const SchoolPanel(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TagButton(
                      text: 'Identificar Biometria',
                      onPressed: (() => {
                            biometricsController.restart(),
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
                if (snapshot.hasError) return Center(child: Text(snapshot.error.toString()));
                log("SchoolEntrace: ${snapshot.data.toString()}");
                log(biometricsController.timeout().toString());
                if (snapshot.data == null) {
                  return Expanded(
                    child: Center(
                        // heightFactor: 10.0,
                        child: TagButton(
                            text: 'Identificar Aluno',
                            onPressed: (() => {
                                  biometricsController.startIdentification(),
                                  biometricsController.dateBiometrics(),
                                }))),
                  );
                }
                if (!biometricsController.timeout()) return const Center(child: Text('Timer Out'));
                if (snapshot.data?.event.code == BioEvents.timeout.code) {
                  biometricsController.disconnect();
                  return Center(
                    heightFactor: 10.0,
                    child: TagButton(
                        text: 'Identificar Aluno',
                        onPressed: (() => {
                              biometricsController.startIdentification(),
                              biometricsController.dateBiometrics(),
                            })),
                  );
                }
                if (snapshot.data?.event.code == BioEvents.fingerDected.code) {
                  fingerprintPressed(snapshot.data!.student!.id ?? 0);
                }

                if (snapshot.data?.event == BioEvents.waiting && biometricsController.timeout()) {
                  child = FingerMensage(text: snapshot.data!.event.info, code: snapshot.data?.event.code);
                }
                if (snapshot.data?.event.code == BioEvents.modeling.code) {
                  child = FingerMensage(text: snapshot.data!.event.info, code: snapshot.data?.event.code);
                }
                if (snapshot.data?.event.code == BioEvents.searching.code) {
                  child = FingerMensage(text: snapshot.data!.event.info, code: snapshot.data?.event.code);
                }
                if (snapshot.data?.event.code == BioEvents.fingerDected.code) {
                  child = StudentInfo(student: snapshot.data!.student);
                }
                if (snapshot.data?.event.code == BioEvents.fingerNotFound.code) {
                  child = FingerMensage(text: snapshot.data!.event.info, code: snapshot.data?.event.code);
                }

                return Column(
                  children: [
                    if (snapshot.data?.event == BioEvents.waiting &&
                        biometricsController.timeout())
                      FingerMensage(
                          text: snapshot.data!.event.info,
                          code: snapshot.data?.event.code),
                    if (snapshot.data?.event.code == BioEvents.modeling.code)
                      FingerMensage(
                          text: snapshot.data!.event.info,
                          code: snapshot.data?.event.code),
                    if (snapshot.data?.event.code == BioEvents.searching.code)
                      FingerMensage(
                          text: snapshot.data!.event.info,
                          code: snapshot.data?.event.code),
                    if (snapshot.data?.event.code ==
                        BioEvents.fingerDected.code)
                      StudentInfo(student: snapshot.data!.student),
                    if (snapshot.data?.event.code ==
                        BioEvents.fingerNotFound.code)
                      FingerMensage(
                          text: snapshot.data!.event.info,
                          code: snapshot.data?.event.code),
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
