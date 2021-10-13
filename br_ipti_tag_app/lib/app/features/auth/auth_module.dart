import 'package:br_ipti_tag_app/app/core/plataform/pkg_info_service.dart';
import 'package:br_ipti_tag_app/app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/presentation/bloc/login_bloc.dart';
import 'package:br_ipti_tag_app/app/features/auth/presentation/pages/auth_login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/local/auth_local_datasource.dart';
import 'domain/usecases/verify_auth_usecase.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    // datasources
    Bind.factory((i) => AuthRemoteDataSourceImpl(i.get())),
    Bind.factory((i) => AuthLocalDataSourceImpl()),
    // repository
    Bind.factory(
      (i) => AuthRespositoryImpl(
        authRemoteDataSource: i.get(),
        authLocalDataSource: i.get(),
      ),
    ),
    // usecases
    Bind.factory((i) => AuthLoginUsecase(i.get())),
    Bind.factory((i) => VerifyAuthUsecase(i.get())),
    // bloc
    Bind.singleton((i) => LoginBloc(
          i.get<AuthLoginUsecase>(),
          i.get<VerifyAuthUsecase>(),
          i.get<PackageInfoService>(),
        )),
  ];

  @override
  final List<ModularRoute<void>> routes = [
    ChildRoute("/", child: (_, args) => const AuthLoginPage()),
  ];
}
