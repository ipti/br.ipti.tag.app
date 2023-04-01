import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_network/tag_network.dart';
import 'data/datasources/remote/teacher_remote_datasource.dart';
import 'data/repositories/teacher_repository_impl.dart';

class TeacherSDKModule extends Module {
  @override
  final List<Bind> binds = [
    // datasources
    Bind.factory(
      (i) => TeacherRemoteDataSource(
        i.get<RouterAPI>(),
      ),
      export: true,
    ),

    // repositories
    Bind.factory(
      (i) => InstructorRepositoryImpl(
        i.get<TeacherRemoteDataSource>(),
      ),
      export: true,
    ),
  ];
}
