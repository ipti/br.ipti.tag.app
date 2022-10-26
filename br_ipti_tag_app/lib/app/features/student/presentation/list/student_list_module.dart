import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/student_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/repositories/student_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/list_student_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/list/bloc/student_list_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/list/student_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class StudentListModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  final List<Bind> binds = [
    // datasources
    Bind.factory(
      (i) => StudentRemoteDataSource(
        i.get(),
      ),
      export: true,
    ),

    // repositories
    Bind.factory(
      (i) => StudentRepositoryImpl(
        i.get(),
      ),
      export: true,
    ),

    // usecases
    Bind.factory(
      (i) => ListStudentsUsecase(
        i.get(),
      ),
      export: true,
    ),

    // list
    BlocBind.factory(
      (i) => StudentListBloc(
        i.get(),
      ),
      export: true,
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
