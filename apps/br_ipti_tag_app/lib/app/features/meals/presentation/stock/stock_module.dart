import 'package:br_ipti_tag_app/app/app_module.dart';

import 'package:br_ipti_tag_app/app/features/meals/presentation/stock/details_item_stock/details_item_stock_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../../domain/usecases/list_ingredients_stock_usecase.dart';
import 'list_items_stock/bloc/stock_bloc.dart';
import 'list_items_stock/stock_page.dart';

class StockModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        MealsSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    BlocBind.lazySingleton(
      (i) => StockBloc(
        i.get<ListIngredientUsecase>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const StockPage(),
    ),
    ChildRoute(
      "/ingrediente",
      child: (_, args) => DetailsItemStockPage(
        ingredient: args.data as Ingredient,
      ),
    ),
  ];
}
