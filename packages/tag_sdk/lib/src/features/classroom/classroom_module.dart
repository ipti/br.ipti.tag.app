import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_network/tag_network.dart';

import 'data/datasource/classroom_datasource.dart';
import 'data/repositories/classroom_repository_impl.dart';
import 'domain/repositories/classroom_repository.dart';
import 'domain/usecases/create_classroom_usecase.dart';
import 'domain/usecases/create_instructor_teaching_data_usecase.dart';
import 'domain/usecases/delete_classroom_usecase.dart';
import 'domain/usecases/list_classrooms_usecase.dart';

import 'domain/usecases/list_instructors_teaching_data_usecase.dart';
import 'domain/usecases/update_classroom_usecase.dart';
import 'domain/usecases/update_instructor_teaching_data_usecase.dart';

class ClassroomSDKModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasource
    Bind.factory(
      (i) => ClassroomRemoteDataSource(
        i.get<RouterAPI>(),
      ),
      export: true,
    ),
    // Repositories
    Bind.singleton(
      (i) => ClassroomRepositoryImpl(
        classroomRemoteDataSource: i.get<ClassroomRemoteDataSource>(),
      ),
      export: true,
    ),

    // List
    Bind.singleton(
      (i) => ListClassroomsUsecase(
        i.get<ClassroomRepository>(),
      ),
      export: true,
    ),

    Bind.singleton(
      (i) => ListInstructorsTeachingDataUseCase(
        i.get<ClassroomRepository>(),
      ),
      export: true,
    ),

    // Create
    Bind.singleton(
      (i) => CreateClassroomUsecase(
        i.get<ClassroomRepository>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => CreateInstructorTeachingDataUseCase(
        i.get<ClassroomRepository>(),
      ),
      export: true,
    ),

    //UpdateDelete
    Bind.singleton(
      (i) => UpdateClassroomUsecase(
        i.get<ClassroomRepository>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => DeleteClassroomUsecase(
        i.get<ClassroomRepository>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => CreateInstructorTeachingDataUseCase(
        i.get<ClassroomRepository>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => UpdateInstructorTeachingDataUseCase(
        i.get<ClassroomRepository>(),
      ),
      export: true,
    ),
  ];
}
