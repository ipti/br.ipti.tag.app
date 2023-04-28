import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/controller.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/sign_state.dart';
import 'package:br_ipti_tag_biometry_app/widgets/modal_biometrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import '../identification/controller.dart';

class BiometricsSign extends StatefulWidget {
  const BiometricsSign({super.key, required this.studentId});

  final int studentId;

  @override
  State<BiometricsSign> createState() => _BiometricsSignPageState();
}

class _BiometricsSignPageState extends State<BiometricsSign> {
  final biometricsController = Modular.get<ControllerIdentification>();
  final signController = Modular.get<ControllerSign>();
  @override
  void initState() {
    signController.init();
    signController.biometricsService.streamSocket.getResponse
        .listen((data) async {
      log("Biometrics sign: ${data.toString()}");
      signController.dateBiometrics(data);
    });
    signController.fetchStudent(widget.studentId);
    super.initState();
  }

  void deleteBiometrics(BuildContext context) {
    signController.deleteFinger();

    // signController.dateBiometrics();
  }

  // void deleteAllBiometrics(BuildContext context) {
  //   signController.biometricsService.streamSocket.dispose();
  //   signController.biometricsService.emit('message', 'ClearSendMessage');
  //   signController.biometricsService.streamSocket.getResponse
  //       .listen((data) {
  //     print(data?['id']?.toString() ?? "");
  //   });
  // }

  final mapBioStudent = {50: 2};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            TagAppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 24.0,
                ),
                onPressed: () => Modular.to.pop(),
              ),
            ),
            StreamBuilder<SignState>(
                stream: signController.stateSignStream.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const Text('Foto do Aluno'),
                              // Padding(
                              //   padding: const EdgeInsets.all(40.0),
                              //   child: Container(
                              //     height: 128.0,
                              //     width: 128.0,
                              //     decoration: const BoxDecoration(
                              //         color: TagColors.colorBaseCloudDark,
                              //         shape: BoxShape.circle,
                              //         image: DecorationImage(
                              //             fit: BoxFit.fill,
                              //             image: NetworkImage(
                              //                 'https://images.suamusica.com.br/ehQJ5PRLM5_B6G56VmLuTigVsTU=/240x240/filters:format(webp)/49091608/3331189/cd_cover.jpg'))),
                              //   ),
                              // ),
                              const SizedBox(
                                height: 32.0,
                              ),
                              const Text(
                                'Identificação',
                                style: TextStyle(
                                    color: TagColors.colorBaseInkLight,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Inter'),
                              ),
                              const SizedBox(height: 32.0),
                              Container(
                                width: 720.0,
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: TagColors.colorBaseProductNormal,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Nome',
                                      style: TextStyle(
                                          color: TagColors.colorBaseCloudNormal,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Inter'),
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'Data de Nascimento',
                                          style: TextStyle(
                                              color: TagColors
                                                  .colorBaseCloudNormal,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Inter'),
                                        ),
                                        SizedBox(
                                          width: 64.0,
                                        ),
                                        Text(
                                          'Sexo',
                                          style: TextStyle(
                                              color: TagColors
                                                  .colorBaseCloudNormal,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Inter'),
                                        ),
                                        SizedBox(
                                          width: 32.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 720.0,
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: TagColors.colorBaseCloudDark,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data?.student?.name ?? "",
                                      style: const TextStyle(
                                          color: TagColors.colorBaseInkLight,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Inter'),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data?.student?.birthday ??
                                              "",
                                          style: const TextStyle(
                                              color:
                                                  TagColors.colorBaseInkLight,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Inter'),
                                        ),
                                        const SizedBox(
                                          width: 82.0,
                                        ),
                                        Text(
                                          snapshot.data?.student?.sex == 1
                                              ? "Masculino"
                                              : "Feminino",
                                          style: const TextStyle(
                                              color:
                                                  TagColors.colorBaseInkLight,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Inter'),
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 64.0),
                              const Text(
                                'Gerenciamento de Biometria',
                                style: TextStyle(
                                    color: TagColors.colorBaseInkLight,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Inter'),
                              ),
                              const SizedBox(height: 32.0),
                              Row(
                                children: [
                                  TagButton(
                                    text: 'Cadastrar',
                                    onPressed: () =>
                                        {
                                          biometricsController.restart(),
                                          biometricsController.dateBiometrics(),
                                          showCustomDialog(context)
                                        },
                                  ),
                                  const SizedBox(
                                    width: 32.0,
                                  ),
                                  TagButton(
                                    textButtonColor:
                                        TagColors.colorBaseInkNormal,
                                    buttonStyle: TagButtonStyles.secondary,
                                    text: 'Excluir',
                                    onPressed: () =>
                                        {deleteBiometrics(context)},
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: TagButton(
                                  //     textButtonColor:
                                  //         TagColors.colorBaseInkNormal,
                                  //     buttonStyle: TagButtonStyles.secondary,
                                  //     text: 'Salvar Image',
                                  //     onPressed: () => {},
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: TagButton(
                                  //     textButtonColor:
                                  //         TagColors.colorBaseInkNormal,
                                  //     buttonStyle: TagButtonStyles.secondary,
                                  //     text: 'Limpar Biometrias Cadastradas',
                                  //     onPressed: () => {},
                                  //   ),
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: Text(snapshot.data?.event.info ?? ""),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
