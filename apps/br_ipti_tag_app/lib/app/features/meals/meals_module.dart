import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'domain/usecases/list_ingredients_stock_usecase.dart';
import 'domain/usecases/list_meals_menu_usecase.dart';
import 'presentation/meals_menu/details_meal/details_meal_page.dart';
import 'presentation/meals_menu/list_meals/bloc/list_meals_bloc.dart';
import 'presentation/meals_menu/list_meals/list_meals_page.dart';
import 'presentation/select_action/select_action_meals_page.dart';
import 'presentation/stock/stock_module.dart';

class MealsModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.singleton(
          (i) => ListMealsMenuUsecase(
        i.get<MealsMenuRepositoryImpl>(),
      ),
    ),

    Bind.singleton(
          (i) => ListIngredientUsecase(
        i.get<IngredientRepositoryImpl>(),
      ),
    ),

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
    BlocBind.singleton((i) => ListMealsBloc(
          i.get(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const SelectActionMealsPage(),
    ),
    ChildRoute(
      "/details",
      child: (_, args) => DetailsMealPage(
        meal: (args.data as Map)['mealComponent'],
      ),
    ),
    ChildRoute(
      "/refeicoes",
      child: (_, args) => const ListMealsPage(),
    ),
    ModuleRoute(
      "/estoque",
      module: StockModule(),
    ),
  ];
}
