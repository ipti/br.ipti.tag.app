import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/list/bloc/teacher_bloc.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/list/pages/teacher_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'presentation/create/create_instructor_module.dart';

class TeacherModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  final List<Bind> binds = [
    // datasources
    Bind.factory((i) => TeacherRemoteDataSource(
          i.get(),
        )),

    // repositories
    Bind.factory((i) => InstructorRepositoryImpl(
          i.get(),
        )),

    // usecases
    Bind.factory((i) => ListInstructorsUsecase(
          i.get(),
        )),

    // list
    BlocBind.factory((i) => TeacherListBloc(
          i.get(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const TeacherPage(),
    ),
    ModuleRoute(
      "/registro",
      module: CreateInstructorModule(),
    ),
  ];
}
