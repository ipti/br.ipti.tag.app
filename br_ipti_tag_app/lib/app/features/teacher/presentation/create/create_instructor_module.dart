import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_cities_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_ufs_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/edcenso_locations_module.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/repositories/instructor_repository.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/usecases/create_instructor_usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/bloc/create_instructor_bloc.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/pages/create_instructor_page.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/address/bloc/instructor_address_bloc.dart';
import 'pages/personal/bloc/instructor_personal_bloc.dart';

class CreateInstructorModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasources

    // Repositories

    // Usecases
    Bind.factory(
      (i) => CreateInstructorsUsecase(
        i.get<InstructorRepository>(),
      ),
    ),
    // Blocs
    Bind.singleton(
      (i) => CreateInstructorBloc(
        i.get<CreateInstructorsUsecase>(),
      ),
    ),
    Bind.singleton((i) => InstructorPersonalBloc()),
    Bind.singleton(
      (i) => InstructorAddressBloc(
        i.get<ListCitiesUsecase>(),
        i.get<ListUFsUsecase>(),
      ),
    ),
  ];

  @override
  List<Module> get imports {
    return [
      EdcensoLocationsModule(),
    ];
  }

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
