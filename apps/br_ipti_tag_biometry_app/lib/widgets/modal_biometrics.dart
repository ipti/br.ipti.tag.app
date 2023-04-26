import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/core/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/controller.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/sign_state.dart';
import 'package:br_ipti_tag_biometry_app/widgets/finger_mensage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

void showCustomDialog(BuildContext context) {
  // final biometricsService = BiometricsService;
  final signController = Modular.get<ControllerSign>();
  // biometricsController.biometricsService.streamSocket.dispose();

  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 398,
          width: 600,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(color: Colors.white),
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Cadastrar Biometria',
                        style: TextStyle(
                            color: TagColors.colorBaseInkLight,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter'),
                      ),
                      StreamBuilder<SignState?>(
                        stream: signController.getResponseSign,
                        builder: (context, snapshot) {
                          log("Modal: ${snapshot.data.toString()}");
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (snapshot.data == null)
                                Center(
                                  heightFactor: 9.0,
                                  child: TagButton(
                                      text: 'Começar',
                                      onPressed: (() =>
                                          {signController.startSign()})),
                                ),
                              if (snapshot.data?.event.code ==
                                  BioEvents.waiting.code)
                                FingerMensage(
                                    text: snapshot.data!.event.info,
                                    code: snapshot.data?.event.code),
                              if (snapshot.data?.event.code ==
                                  BioEvents.modeling.code)
                                FingerMensage(
                                    text: BioEvents.modeling.info,
                                    code: snapshot.data?.event.code),
                              if (snapshot.data?.event.code ==
                                  BioEvents.modeled.code)
                                FingerMensage(
                                    text: BioEvents.modeling.info,
                                    code: snapshot.data?.event.code),
                              if (snapshot.data?.event.code ==
                                  BioEvents.putfinger.code)
                                FingerMensage(
                                    text: snapshot.data!.event.info,
                                    code: snapshot.data?.event.code),
                              if (snapshot.data?.event.code ==
                                  BioEvents.pictureTaken.code)
                                FingerMensage(
                                    text: snapshot.data!.event.info,
                                    code: snapshot.data?.event.code),
                              if (snapshot.data?.event.code ==
                                  BioEvents.waitingFinger.code)
                                FingerMensage(
                                    text: snapshot.data!.event.info,
                                    code: snapshot.data?.event.code),
                              if (snapshot.data?.event.code ==
                                  BioEvents.storeok.code)
                                FingerMensage(
                                    text: snapshot.data!.event.info,
                                    code: snapshot.data?.event.code),
                              if (snapshot.data?.event.code ==
                                  BioEvents.carrer.code)
                                FingerMensage(
                                    text: snapshot.data!.event.info,
                                    code: snapshot.data?.event.code),
                              if (snapshot.data?.event.code ==
                                  BioEvents.stored.code)
                                FingerMensage(
                                    text: snapshot.data!.event.info,
                                    code: snapshot.data?.event.code),
                              if (snapshot.data?.event.code ==
                                  BioEvents.storeFail.code)
                                FingerMensage(
                                    text: snapshot.data!.event.info,
                                    code: snapshot.data?.event.code),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
