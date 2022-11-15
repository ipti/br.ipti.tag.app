import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/bloc/create_instructor_bloc.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/pages/create_instructor_page.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/pages/education/bloc/instructor_education_bloc.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/pages/update_instructor_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'pages/address/bloc/instructor_address_bloc.dart';
import 'pages/personal/bloc/instructor_personal_bloc.dart';

class CreateInstructorModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        EdcensoLocationsSDKModule(),
      ];

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
    BlocBind.singleton(
      (i) => CreateInstructorBloc(
        i.get<CreateInstructorsUsecase>(),
        i.get<UpdateInstructorsUsecase>(),
        i.get<GetInstructorsUsecase>(),
      ),
    ),
    Bind.singleton(
      (i) => InstructorPersonalBloc(),
    ),
    BlocBind.singleton(
      (i) => InstructorAddressBloc(
        i.get<ListCitiesUsecase>(),
        i.get<ListUFsUsecase>(),
      ),
    ),
    BlocBind.singleton(
      (i) => InstructorEducationBloc(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const InstructorFormPage(),
    ),
    ChildRoute(
      "/editar",
      child: (_, args) => UpdateInstructorPage(
        title: (args.data as Instructor?)?.name,
        instructor: args.data as Instructor?,
      ),
    ),
  ];
}
