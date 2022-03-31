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
    // Repositories
    Bind.singleton((i) => ClassroomRepositoryImpl()),

    // List
    Bind.singleton((i) => ListClassroomsUsecase(i.get())),
    Bind.singleton((i) => ClassroomListBloc(i.get())),

    // Create
    Bind.singleton((i) => CreateClassroomUsecase(i.get())),
    Bind.singleton((i) => ClassroomCreateBloc(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => const ClassroomPage()),
    ChildRoute("/create", child: (_, args) => const ClassroomCreatePage()),
  ];
}
