import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/local/meals_menu_dumb_datasource.dart';
import 'data/datasources/remote/meals_remote_datasource.dart';
import 'data/repositories/meals_menu_repository_impl.dart';
import 'domain/usecases/list_meals_menu_usecase.dart';
import 'mappers/meal_menu_api_to_entity.dart';

class MealsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory(
      (i) => MealsMenuEntityMapper(),
    ),
    Bind.singleton(
      (i) => MealsMenuDumbDataSourceImpl(),
    ),
    Bind.singleton(
      (i) => MealsMenuRemoteDataSource(
        i.get(),
      ),
    ),
    Bind.singleton(
      (i) => MealsMenuRepositoryImpl(
        dumbDataSource: i.get(),
        remoteDataSource: i.get(),
        mapper: i.get(),
      ),
    ),
    Bind.singleton((i) => ListMealsMenuUsecase(
          i.get(),
        )),
  ];
}
