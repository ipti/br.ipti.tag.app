import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/features/auth/domain/usecases/verify_auth_usecase.dart';
import 'data/datasources/local/auth_local_datasource.dart';
import 'data/datasources/remote/auth_remote_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_usecase.dart';

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
      (i) => AuthRespositoryImpl(
        authRemoteDataSource: i.get<AuthRemoteDataSource>(),
        authLocalDataSource: i.get<AuthLocalDataSource>(),
      ),
      export: true,
    ),
    // usecases
    Bind.singleton(
      (i) => AuthLoginUsecase(
        i.get<AuthRepository>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => VerifyAuthUsecase(
        i.get<AuthRepository>(),
      ),
      export: true,
    ),
  ];
}
