import 'package:flutter_modular/flutter_modular.dart';

import 'personal_data_form_page.dart';

class PersonalDataFormModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => PersonalDataFormPage()),
  ];
}
