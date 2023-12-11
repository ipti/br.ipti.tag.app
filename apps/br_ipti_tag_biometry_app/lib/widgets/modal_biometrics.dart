import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/core/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/controller.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/sign_state.dart';
import 'package:br_ipti_tag_biometry_app/widgets/finger_mensage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../screens/biometrics/presentation/identification/controller.dart';

void showCustomDialog(BuildContext context, ControllerIdentification biometricsController) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Cadastrar Biometria',
                        style: TextStyle(color: TagColors.colorBaseInkLight, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Inter'),
                      ),
                      const SizedBox(height: 20),
                      StreamBuilder<SignState?>(
                        stream: signController.getResponseSign,
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return TagButton(
                              text: 'Começar',
                              onPressed: () {
                                biometricsController.startBiometricService();
                                signController.startSign();
                              },
                            );
                          }
                          switch (snapshot.data!.event) {
                            case BioEvents.putfinger:
                              return FingerMensage(text: BioEvents.putfinger.info, code: BioEvents.putfinger.code);
                            case BioEvents.putFingerAgain:
                              return FingerMensage(text: BioEvents.putFingerAgain.info, code: BioEvents.putFingerAgain.code);
                            case BioEvents.waitingFinger:
                              return FingerMensage(text: BioEvents.waitingFinger.info, code: BioEvents.waitingFinger.code);
                            case BioEvents.modeling:
                              return FingerMensage(text: BioEvents.modeling.info, code: BioEvents.modeling.code);
                            case BioEvents.modeled:
                              return FingerMensage(text: BioEvents.modeled.info, code: BioEvents.modeled.code);
                            case BioEvents.storeok:
                              return FingerMensage(text: BioEvents.storeok.info, code: BioEvents.storeok.code);
                            case BioEvents.carrer:
                              return FingerMensage(text: BioEvents.carrer.info, code: BioEvents.carrer.code);
                            case BioEvents.stored:
                              return FingerMensage(text: BioEvents.stored.info, code: BioEvents.stored.code);
                            case BioEvents.storeFail:
                              return FingerMensage(text: BioEvents.storeFail.info, code: BioEvents.storeFail.code);
                            case BioEvents.removeFinger:
                              return FingerMensage(text: BioEvents.removeFinger.info, code: BioEvents.removeFinger.code);
                            default:
                              return const SizedBox();
                          }
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
