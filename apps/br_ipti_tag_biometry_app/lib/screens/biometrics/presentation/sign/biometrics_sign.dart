import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/controller.dart';
import 'package:br_ipti_tag_biometry_app/widgets/modal_biometrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

class BiometricsSign extends StatefulWidget {
  const BiometricsSign({super.key, required this.studentId});

  final int studentId;

  @override
  State<BiometricsSign> createState() => _BiometricsSignPageState();
}

class _BiometricsSignPageState extends State<BiometricsSign> {
  final signController = Modular.get<ControllerSign>();
  @override
  void initState() {
    signController.fetchStudent(widget.studentId);
    super.initState();
  }

  // void deleteBiometrics(BuildContext context) {
  //   signController.biometricsService.streamSocket.dispose();
  //   signController.biometricsService.emit('IdDelete', 80);
  //   signController.biometricsService.streamSocket.getResponse
  //       .listen((data) {
  //     print(data?['id']?.toString() ?? "");
  //   });
  // }

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
            StreamBuilder<StudentIdentification>(
                stream: signController.studentStream.stream,
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
                              Text(snapshot.data?.name ?? ""),
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
                                      onPressed: () =>
                                          {showCustomDialog(context)},
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TagButton(
                                      textButtonColor:
                                          TagColors.colorBaseInkNormal,
                                      buttonStyle: TagButtonStyles.secondary,
                                      text: 'Excluir',
                                      onPressed: () => {},
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TagButton(
                                      textButtonColor:
                                          TagColors.colorBaseInkNormal,
                                      buttonStyle: TagButtonStyles.secondary,
                                      text: 'Salvar Image',
                                      onPressed: () => {},
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TagButton(
                                      textButtonColor:
                                          TagColors.colorBaseInkNormal,
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
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
