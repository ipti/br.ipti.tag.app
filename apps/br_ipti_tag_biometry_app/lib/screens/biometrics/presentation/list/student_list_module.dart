import 'package:br_ipti_tag_biometry_app/app_module.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/list/bloc/student_list_bloc.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/list/student_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

class StudentListModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        StudentSDKModule(),
      ];

  @override
  final List<Bind> binds = [
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
