import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/school_remote_datasource.dart';
import 'data/repositories/school_repository_impl.dart';
import 'domain/usecases/edit_school_usecase.dart';
import 'domain/usecases/show_school_usecase.dart';

class SchoolModule extends Module {
  @override
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

        // UseCases
        Bind.singleton(
          (i) => EditSchoolUsecase(
            i.get<SchoolRepositoryImpl>(),
          ),
        ),
        Bind.singleton((i) => ShowSchoolUsecase(
              i.get(),
            )),
      ];
}
