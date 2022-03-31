import 'package:br_ipti_tag_app/app/features/teacher/mappers/teacher_api_to_entity.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/list/bloc/teacher_bloc.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/list/pages/teacher_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/remote/teacher_remote_datasource.dart';
import 'data/repositories/teacher_repository_impl.dart';
import 'domain/usecases/list_teachers_usecase.dart';

class TeacherModule extends Module {
  @override
  final List<Bind> binds = [
    // mappers
    Bind.factory((i) => TeacherApiToEntityMapper()),

    // datasources
    Bind.factory((i) => TeacherRemoteDataSource(i.get())),

    // repositories
    Bind.factory((i) => TeacherRepositoryImpl(i.get(), i.get())),

    // usecases
    Bind.factory((i) => ListTeachersUsecase(i.get())),

    // list
    Bind.factory((i) => TeacherListBloc(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => const TeacherPage()),
  ];
}
