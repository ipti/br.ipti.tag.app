import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/features/student/list/bloc/student_list_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/list/student_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../domain/usecases/list_student_usecase.dart';

class StudentListModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        StudentSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    // list
    BlocBind.factory(
      (i) => StudentListBloc(
        i.get<ListStudentsUsecase>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const StudentPage(),
    ),
  ];
}
