import 'package:flutter/material.dart';

import 'package:tag_ui/tag_ui.dart';

class SchoolEntrance extends StatefulWidget {
  const SchoolEntrance({super.key});

  @override
  State<SchoolEntrance> createState() => _SchoolEntrancePageState();
}

class _SchoolEntrancePageState extends State<SchoolEntrance> {
  final mapBioStudent = {50: 2};
  @override
  Widget build(BuildContext context) {
    mapBioStudent[50];
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: TagColors.colorBaseCloudDark,
              ),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 128,
                          width: 128,
                          decoration: BoxDecoration(
                            color: TagColors.colorBaseWhiteNormal,
                            border: Border.all(
                                color: TagColors.colorBaseProductLogo),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100.0)),
                          ),
                          child: const Icon(
                            Icons.logo_dev,
                            size: 64,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text('Escola',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                color: TagColors.colorBaseProductLogo)),
                      ],
                    ),
                    TagIcon(
                      defaultVersionPath: FilePaths.LOGO_PATH_SVG,
                      disabledVersionPath: FilePaths.LOGO_PATH_SVG,
                      maxHeight: 100.0,
                      maxWidth: 100.0,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 128.0, left: 128.0),
              child: Row(
                children: [
                  Container(
                    height: 256.0,
                    width: 256.0,
                    decoration: const BoxDecoration(
                      color: TagColors.colorBaseCloudDark,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Icon(size: 256.0, Icons.person),
                  ),
                  const SizedBox(
                    width: 120.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 500.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: TagColors.colorBaseProductNormal,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: const Text(
                          'Nome',
                          style: TextStyle(
                              color: TagColors.colorBaseCloudNormal,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter'),
                        ),
                      ),
                      Container(
                        width: 500.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: TagColors.colorBaseCloudDark,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: const Text(
                          'Gabriel Santos Silva',
                          style: TextStyle(
                              color: TagColors.colorBaseInkLight,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter'),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: 200.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: TagColors.colorBaseProductNormal,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: const Text(
                          'Turma',
                          style: TextStyle(
                              color: TagColors.colorBaseCloudNormal,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter'),
                        ),
                      ),
                      Container(
                        width: 200.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: TagColors.colorBaseCloudDark,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: const Text(
                          '3B',
                          style: TextStyle(
                              color: TagColors.colorBaseInkLight,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter'),
                        ),
                      )
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
