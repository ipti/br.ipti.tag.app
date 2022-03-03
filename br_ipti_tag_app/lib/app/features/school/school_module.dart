import 'package:br_ipti_tag_app/app/features/school/presentation/pages/school_edit_page.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/pages/school_info_page.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/pages/school_main_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SchoolModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => super.binds;

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const SchoolMainPage()),
        ChildRoute("/informacoes", child: (_, args) => const SchoolInfoPage()),
        ChildRoute("/editar", child: (_, args) => const SchoolEditPage()),
      ];
}
