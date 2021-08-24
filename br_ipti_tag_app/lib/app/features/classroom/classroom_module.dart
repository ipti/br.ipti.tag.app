import 'package:br_ipti_tag_app/app/features/classroom/data/repositories/classroom_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/crate_classroom_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/create/bloc/classroom_create_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/create/classroom_create_page.dart';
import 'presentation/list/bloc/classroom_list_bloc.dart';
import 'presentation/list/classroom_page.dart';

class ClassroomModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasources

    // Repositories
    Bind.singleton((i) => new ClassroomRepositoryImpl()),

    // List
    Bind.singleton((i) => new ListClassroomsUsecase(i.get())),
    Bind.singleton((i) => new ClassroomListBloc(i.get())),

    // Create
    Bind.singleton((i) => new CreateClassroomUsecase(i.get())),
    Bind.singleton((i) => new ClassroomCreateBloc(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => ClassroomPage()),
    ChildRoute("create", child: (_, args) => ClassroomCreatePage()),
  ];
}
