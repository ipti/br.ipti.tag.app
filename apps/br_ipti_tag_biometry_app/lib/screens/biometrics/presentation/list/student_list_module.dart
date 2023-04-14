import 'package:br_ipti_tag_biometry_app/app_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/list/bloc/student_list_bloc.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/list/student_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../../../student/domain/usecases/list_student_usecase.dart';

class StudentListModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        StudentSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.factory(
          (i) => ListStudentsUsecase(
        i.get<StudentRepositoryImpl>(),
      ),
    ),

    // list
    Bind.factory(
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
