import 'package:br_ipti_tag_app/app/features/classroom/data/datasource/classroom_datasource.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/repositories/classroom_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/create_classroom_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/delete_classroom_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/update_classroom_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/create/bloc/classroom_create_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/classroom_update_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_delete_classroom_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/create/classroom_create_page.dart';
import 'presentation/list/bloc/classroom_list_bloc.dart';
import 'presentation/list/classroom_page.dart';

class ClassroomModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasource
    Bind.factory(
      (i) => ClassroomRemoteDataSource(
        i.get(),
      ),
    ),
    // Repositories
    Bind.singleton(
      (i) => ClassroomRepositoryImpl(
        classroomRemoteDataSource: i.get(),
      ),
    ),

    // List
    Bind.singleton((i) => ListClassroomsUsecase(i.get())),
    Bind.singleton((i) => ClassroomListBloc(i.get())),

    // Create
    Bind.singleton((i) => CreateClassroomUsecase(i.get())),
    Bind.singleton((i) => ClassroomCreateBloc(i.get())),

    //UpdateDelete
    Bind.singleton((i) => UpdateClassroomUsecase(i.get())),
    Bind.singleton((i) => DeleteClassroomUsecase(i.get())),
    Bind.singleton((i) => ClassroomUpdateDeleteBloc(i.get())),
  ];

  @override
  final List<ModularRoute<void>> routes = [
    ChildRoute("/", child: (_, args) => const ClassroomPage()),
    ChildRoute("create", child: (_, args) => const ClassroomCreatePage()),
    ChildRoute("updateDelete",
        child: (_, args) => const ClassroomUpdateDeletePage()),
    ChildRoute("C",
        child: (_, args) => const ClassroomUpdateDeletePage()),
    ChildRoute("UpdateDelete",
        child: (_, args) => const ClassroomUpdateDeletePage()),
  ];
}
