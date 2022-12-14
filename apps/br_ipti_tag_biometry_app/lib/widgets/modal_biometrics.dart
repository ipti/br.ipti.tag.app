import 'package:br_ipti_tag_biometry_app/controller/controller.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:br_ipti_tag_biometry_app/widgets/finger_mensage.dart';
import 'package:br_ipti_tag_biometry_app/widgets/waiting_biometrics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context) {
  final biometricsController = ControllerBiometrics();
  final biometricsService = BiometricsService();
  biometricsController.dateBiometrics();
  biometricsService.connectAndListen();

  biometricsService.streamSocket.getResponse.listen((data) {
    print(data?['id']?.toString() ?? "");
  });

  biometricsService.emit("IdStore", 122);
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
                children: [
                  Column(
                    children: [
                      const Text('Cadastrar Biometria'),
                      StreamBuilder<BioEvents?>(
                        stream: biometricsController.getResponseEvents,
                        builder: (context, snapshot) {
                          return Column(
                            children: [
                              if (snapshot.data?.code == 101)
                                const WaitingBiometrics(),
                              if (snapshot.data?.code == 102)
                                FingerMensage(text: snapshot.data!.info),
                              if (snapshot.data?.code == 104)
                                FingerMensage(text: snapshot.data!.info),
                              if (snapshot.data?.code == 105)
                                FingerMensage(text: snapshot.data!.info),
                              if (snapshot.data?.code == 108)
                                FingerMensage(text: snapshot.data!.info),
                              if (snapshot.data?.code == 202)
                                FingerMensage(text: snapshot.data!.info),
                              if (snapshot.data?.code == 502)
                                FingerMensage(text: snapshot.data!.info),
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
