import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/data/datasources/edcenso_locations_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/data/repositories/edcenso_disciplines_repositories_impl.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/domain/repositories/edcenso_disciplines_repositories.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/edcenso_locations_local_datasource.dart';
import 'domain/usecases/list_disciplines_usecase.dart';

class EdcensoDiciplinesModule extends Module {
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
