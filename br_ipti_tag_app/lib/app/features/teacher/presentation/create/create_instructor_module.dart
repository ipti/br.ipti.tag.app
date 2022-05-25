import 'package:br_ipti_tag_app/app/features/edcenso_locations/edcenso_locations_module.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/pages/create_instructor_page.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateInstructorModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasources

    // Repositories

    // Usecases

    // Blocs
  ];

  @override
  List<Module> get imports => [
        EdcensoLocationsModule(),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const InstructorFormPage(),
    ),
    ChildRoute(
      "/edit",
      child: (_, args) => const InstructorFormPage(
        editMode: EditMode.Edit,
      ),
    ),
  ];
}
