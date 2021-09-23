import 'package:br_ipti_tag_app/app/features/meals/data/datasources/meals_of_day_dumb_datasource.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/repositories/meals_of_day_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meal.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/usecases/list_meals_of_day_usecase.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/details_meal/details_meal_page.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/list_items_stock/stock_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/list_meals/bloc/list_meals_bloc.dart';
import 'presentation/list_meals/list_meals_page.dart';
import 'presentation/select_action/select_action_meals_page.dart';

class MealsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => MealsOfDayDumbDataSourceImpl()),
    Bind.singleton((i) => MealsOfDayRepositoryImpl(
          dumbDataSource: i.get(),
        )),
    Bind.singleton((i) => ListMealsOfDayUsecase(i.get())),
    Bind.singleton((i) => ListMealsBloc(i.get())),
  ];

  @override
  final List<ModularRoute<void>> routes = [
    ChildRoute("/", child: (_, args) => const SelectActionMealsPage()),
    ChildRoute(
      "/details",
      child: (_, args) => DetailsMealPage(
        meal: args.data as Meal,
      ),
    ),
    ChildRoute("/refeicoes", child: (_, args) => const ListMealsPage()),
    ModuleRoute("/estoque", module: StockModule()),
  ];
}
