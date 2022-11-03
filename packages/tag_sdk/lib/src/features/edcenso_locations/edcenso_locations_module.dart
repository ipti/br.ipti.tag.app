import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_network/tag_network.dart';

import 'data/datasources/edcenso_locations_local_datasource.dart';
import 'data/datasources/edcenso_locations_remote_datasource.dart';
import 'data/repositories/edcenso_locations_repositories_impl.dart';
import 'domain/repositories/edcenso_locations_repositories.dart';
import 'domain/usecases/list_cities_usecase.dart';
import 'domain/usecases/list_ufs_usecase.dart';

class EdcensoLocationsSDKModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => EdcensoLocationsRemoteDatasource(
        i.get<RouterAPI>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => EdcensoLocationsLocalDatasource(),
      export: true,
    ),
    Bind.singleton(
      (i) => EdcensoLocationsRepositoryImpl(
        i.get<EdcensoLocationsRemoteDatasource>(),
        i.get<EdcensoLocationsLocalDatasource>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => ListCitiesUsecase(
        i.get<EdcensoLocationsRepository>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => ListUFsUsecase(
        i.get<EdcensoLocationsRepository>(),
      ),
      export: true,
    ),
  ];
}
