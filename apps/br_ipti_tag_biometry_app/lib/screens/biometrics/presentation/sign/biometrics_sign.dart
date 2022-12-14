import 'dart:developer';

import 'package:br_ipti_tag_biometry_app/controller/controller.dart';
import 'package:br_ipti_tag_biometry_app/services/socket_io.dart';
import 'package:br_ipti_tag_biometry_app/widgets/finger_mensage.dart';
import 'package:br_ipti_tag_biometry_app/widgets/modal_biometrics.dart';
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
  }

  final mapBioStudent = {50: 2};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const TagAppBar(),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.student.name),
                      const Text('Foto do Aluno'),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          height: 128.0,
                          width: 128.0,
                          decoration: const BoxDecoration(
                              color: TagColors.colorBaseCloudDark,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://images.suamusica.com.br/ehQJ5PRLM5_B6G56VmLuTigVsTU=/240x240/filters:format(webp)/49091608/3331189/cd_cover.jpg'))),
                        ),
                      ),
                      const Text('Gerenciamento de Biometria'),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TagButton(
                              text: 'Cadastrar',
                              onPressed: () => {showCustomDialog(context)},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TagButton(
                              textButtonColor: TagColors.colorBaseInkNormal,
                              buttonStyle: TagButtonStyles.secondary,
                              text: 'Excluir',
                              onPressed: () => {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TagButton(
                              textButtonColor: TagColors.colorBaseInkNormal,
                              buttonStyle: TagButtonStyles.secondary,
                              text: 'Salvar Image',
                              onPressed: () => {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TagButton(
                              textButtonColor: TagColors.colorBaseInkNormal,
                              buttonStyle: TagButtonStyles.secondary,
                              text: 'Limpar Biometrias Cadastradas',
                              onPressed: () => {},
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
