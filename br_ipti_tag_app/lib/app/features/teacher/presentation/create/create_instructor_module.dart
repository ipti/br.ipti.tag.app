import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_cities_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_ufs_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/edcenso_locations_module.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/repositories/instructor_repository.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/usecases/create_instructor_usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/usecases/get_teachers_usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/usecases/update_instructor_usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/bloc/create_instructor_bloc.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/pages/create_instructor_page.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/pages/education/bloc/instructor_education_bloc.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/pages/update_instructor_page.dart';
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
    Bind.factory(
      (i) => UpdateInstructorsUsecase(
        i.get<InstructorRepository>(),
      ),
    ),
    Bind.factory(
      (i) => GetInstructorsUsecase(
        i.get<InstructorRepository>(),
      ),
    ),
    // Blocs
    Bind.singleton(
      (i) => CreateInstructorBloc(
        i.get<CreateInstructorsUsecase>(),
        i.get<UpdateInstructorsUsecase>(),
        i.get<GetInstructorsUsecase>(),
      ),
    ),
    Bind.singleton(
      (i) => InstructorPersonalBloc(),
    ),
    Bind.singleton(
      (i) => InstructorAddressBloc(
        i.get<ListCitiesUsecase>(),
        i.get<ListUFsUsecase>(),
      ),
    ),
    Bind.singleton(
      (i) => InstructorEducationBloc(),
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
    ChildRoute("/", child: (_, args) => const InstructorFormPage()),
    ChildRoute(
      "/editar",
      child: (_, args) => UpdateInstructorPage(
        title: (args.data as Instructor?)?.name,
        instructor: args.data as Instructor?,
      ),
    ),
  ];
}
