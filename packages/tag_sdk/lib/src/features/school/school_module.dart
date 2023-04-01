import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/school_remote_datasource.dart';
import 'data/repositories/school_repository_impl.dart';

class SchoolModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Datasources
        Bind.singleton((i) => SchoolRemoteDataSource(
              i.get(),
            )),

        // Repositories
        Bind.singleton((i) => SchoolRepositoryImpl(
              i.get(),
            )),
      ];
}
