import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/frequency_page.dart';

class FrequencyModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const FrequencyPage(),
    ),
  ];
}
