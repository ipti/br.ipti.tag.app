import 'package:br_ipti_tag_app/app/modules/enrollment/submodules/personal_data_form/personal_data_form_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PersonalDataFormModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => PersonalDataFormPage()),
  ];
}
