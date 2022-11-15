import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_network/tag_network.dart';

import 'data/datasources/edcenso_locations_local_datasource.dart';
import 'data/datasources/edcenso_locations_remote_datasource.dart';
import 'data/repositories/edcenso_disciplines_repositories_impl.dart';
import 'domain/repositories/edcenso_disciplines_repositories.dart';
import 'domain/usecases/list_disciplines_usecase.dart';

class EdcensoDiciplinesSDKModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => EdcensoDisciplinesRemoteDatasource(
        i.get<RouterAPI>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => EdcensoDisciplinesLocalDatasource(),
      export: true,
    ),
    Bind.singleton(
      (i) => EdcensoDisciplinesRepositoryImpl(
        i.get<EdcensoDisciplinesRemoteDatasource>(),
        i.get<EdcensoDisciplinesLocalDatasource>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => ListEdcensoDisciplineUsecase(
        i.get<EdcensoDisciplinesRepository>(),
      ),
      export: true,
    ),
  ];
}
