import 'package:flutter_modular/flutter_modular.dart';

import 'classes_form_page.dart';

class ClassesFormModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ClassesFormPage())
  ];
}
