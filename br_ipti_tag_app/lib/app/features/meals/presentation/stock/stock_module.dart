import 'package:br_ipti_tag_app/app/features/meals/data/datasources/local/ingredient_dumb_datasource.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/datasources/remote/stock_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/repositories/ingredient_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/usecases/list_ingredients_stock_usecase.dart';

import 'package:br_ipti_tag_app/app/features/meals/presentation/stock/details_item_stock/details_item_stock_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'list_items_stock/bloc/stock_bloc.dart';
import 'list_items_stock/stock_page.dart';

class StockModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => IngredientDumbDataSourceImpl(),
    ),
    Bind.lazySingleton((i) => IngredientRemoteDataSourceImpl(
          i.get(),
        )),
    Bind.lazySingleton(
      (i) => IngredientRepositoryImpl(
        dumbDataSource: i.get(),
        remoteDataSource: i.get(),
      ),
    ),
    Bind.lazySingleton((i) => ListIngredientUsecase(
          i.get(),
        )),
    Bind.lazySingleton((i) => StockBloc(
          i.get(),
        )),
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
