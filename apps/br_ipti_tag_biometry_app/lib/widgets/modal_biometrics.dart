import 'package:br_ipti_tag_biometry_app/core/bio_event.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/controller.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/sign_state.dart';
import 'package:br_ipti_tag_biometry_app/widgets/finger_mensage.dart';
import 'package:br_ipti_tag_biometry_app/widgets/waiting_biometrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void showCustomDialog(BuildContext context) {
  // final biometricsService = BiometricsService;
  final biometricsController = Modular.get<ControllerSign>();
  // biometricsController.biometricsService.streamSocket.dispose();
  biometricsController.startSign();
  biometricsController.dateBiometrics();
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
                      const Text('Cadastrar Biometria'),
                      StreamBuilder<SignState?>(
                        stream: biometricsController.getResponseSign,
                        builder: (context, snapshot) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (snapshot.data?.event.code == BioEvents.waiting.code)
                                const WaitingBiometrics(),
                              if (snapshot.data?.event.code ==
                                  BioEvents.modeling.code)
                                FingerMensage(text: BioEvents.modeling.info),
                              if (snapshot.data?.event.code ==
                                  BioEvents.searching.code)
                                FingerMensage(text: snapshot.data!.event.info),
                              if (snapshot.data?.event.code ==
                                  BioEvents.putfinger.code)
                                FingerMensage(text: snapshot.data!.event.info),
                              if (snapshot.data?.event.code ==
                                  BioEvents.waitingFinger.code)
                                FingerMensage(text: snapshot.data!.event.info),
                              if (snapshot.data?.event.code == BioEvents.storeok.code)
                                FingerMensage(text: snapshot.data!.event.info),
                              if (snapshot.data?.event.code ==
                                  BioEvents.storeFail.code)
                                FingerMensage(text: snapshot.data!.event.info),
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
