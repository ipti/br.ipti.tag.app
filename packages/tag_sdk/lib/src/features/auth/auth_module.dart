import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_network/tag_network.dart';
import 'data/datasources/local/auth_local_datasource.dart';
import 'data/datasources/remote/auth_remote_datasource.dart';
import 'domain/repositories/auth_repository_impl.dart';

class AuthSDKModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = [
    // datasources
    Bind.singleton<AuthRemoteDataSource>(
      (i) => AuthRemoteDataSourceImpl(
        i.get<RouterAPI>(),
      ),
      export: true,
    ),
    Bind.singleton<AuthLocalDataSource>(
      (i) => AuthLocalDataSourceImpl(),
      export: true,
    ),
    // repository
    Bind.singleton(
      (i) => AuthRepositoryImpl(
        authRemoteDataSource: i.get<AuthRemoteDataSource>(),
        authLocalDataSource: i.get<AuthLocalDataSource>(),
      ),
      export: true,
    ),
  ];
}
