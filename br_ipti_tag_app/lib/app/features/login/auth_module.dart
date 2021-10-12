import 'package:br_ipti_tag_app/app/features/login/data/datasources/remote/auth_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/login/data/repositories/auth_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/login/domain/usecases/login_usecase.dart';
import 'package:br_ipti_tag_app/app/features/login/presentation/bloc/login_bloc.dart';
import 'package:br_ipti_tag_app/app/features/login/presentation/pages/auth_login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    // datasources
    Bind.factory((i) => AuthRemoteDataSourceImpl(i.get())),
    // repository
    Bind.factory(
      (i) => AuthRespositoryImpl(
        authRemoteDataSource: i.get(),
      ),
    ),
    // usecases
    Bind.factory((i) => AuthLoginUsecase(i.get())),
    // bloc
    Bind.lazySingleton((i) => LoginBloc(i.get())),
  ];

  @override
  final List<ModularRoute<void>> routes = [
    ChildRoute("/", child: (_, args) => const AuthLoginPage()),
  ];
}
