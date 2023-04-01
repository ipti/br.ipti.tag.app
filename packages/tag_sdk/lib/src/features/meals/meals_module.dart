import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_network/tag_network.dart';

import 'data/datasources/local/ingredient_dumb_datasource.dart';
import 'data/datasources/local/meals_menu_dumb_datasource.dart';
import 'data/datasources/remote/meals_remote_datasource.dart';
import 'data/datasources/remote/stock_remote_datasource.dart';
import 'data/repositories/ingredient_repository_impl.dart';
import 'data/repositories/meals_menu_repository_impl.dart';
import 'mappers/meal_menu_api_to_entity.dart';

class MealsSDKModule extends Module {
  @override
  final List<Bind> binds = [
    // Meals
    Bind.factory(
      (i) => MealsMenuEntityMapper(),
      export: true,
    ),
    Bind.singleton(
      (i) => MealsMenuDumbDataSourceImpl(),
      export: true,
    ),
    Bind.singleton(
      (i) => MealsMenuRemoteDataSource(
        i.get<RouterAPI>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => MealsMenuRepositoryImpl(
        dumbDataSource: i.get<MealsMenuDumbDataSource>(),
        remoteDataSource: i.get<MealsMenuRemoteDataSource>(),
        mapper: i.get<MealsMenuEntityMapper>(),
      ),
      export: true,
    ),
    // Stock
    Bind.singleton(
      (i) => IngredientDumbDataSourceImpl(),
      export: true,
    ),
    Bind.singleton(
      (i) => IngredientRemoteDataSourceImpl(
        i.get<RouterAPI>(),
      ),
      export: true,
    ),
    Bind.singleton(
      (i) => IngredientRepositoryImpl(
        dumbDataSource: i.get<IngredientDumbDataSource>(),
        remoteDataSource: i.get<IngredientRemoteDataSource>(),
      ),
      export: true,
    ),
  ];
}
