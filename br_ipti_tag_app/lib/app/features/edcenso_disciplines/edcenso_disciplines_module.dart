import 'package:br_ipti_tag_app/app/features/edcenso_locations/data/datasources/edcenso_locations_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/data/repositories/edcenso_locations_repositories_impl.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_cities_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_ufs_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/edcenso_locations_local_datasource.dart';

class EdcensoLocationsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => EdcensoLocationsRemoteDatasource(
        i.get(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => EdcensoLocationsLocalDatasource(),
      export: true,
    ),
    Bind.singleton(
      (i) => EdcensoLocationsRepositoryImpl(
        i.get(),
        i.get(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => ListCitiesUsecase(
        i.get(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => ListUFsUsecase(
        i.get(),
      ),
      export: true,
    ),
  ];
}
