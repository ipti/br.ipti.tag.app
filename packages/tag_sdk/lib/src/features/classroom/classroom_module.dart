import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_network/tag_network.dart';

import 'data/datasource/classroom_datasource.dart';
import 'data/repositories/classroom_repository_impl.dart';

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


  ];
}
