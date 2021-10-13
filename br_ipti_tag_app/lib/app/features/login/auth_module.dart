import 'package:br_ipti_tag_app/app/features/login/data/datasources/remote/auth_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/login/data/repositories/auth_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/login/domain/usecases/login_usecase.dart';
import 'package:br_ipti_tag_app/app/features/login/presentation/bloc/login_bloc.dart';
import 'package:br_ipti_tag_app/app/features/login/presentation/pages/auth_login_page.dart';
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
    Bind.singleton((i) => LoginBloc(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute<void>> routes = [
    ChildRoute("/", child: (_, args) => const AuthLoginPage()),
  ];
}
