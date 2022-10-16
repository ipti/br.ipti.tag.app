import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/student_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/repositories/student_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/list_student_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/list/bloc/student_list_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/list/student_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentListModule extends Module {
  @override
  final List<Bind> binds = [
    // datasources
    Bind.factory((i) => StudentRemoteDataSource(
          i.get(),
        )),

    // repositories
    Bind.factory((i) => StudentRepositoryImpl(
          i.get(),
        )),

    // usecases
    Bind.factory((i) => ListStudentsUsecase(
          i.get(),
        )),

    // list
    Bind.factory((i) => StudentListBloc(
          i.get(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const StudentPage(),
    ),
  ];
}
