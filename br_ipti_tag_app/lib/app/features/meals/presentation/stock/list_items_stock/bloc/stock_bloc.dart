import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/inventory_ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/usecases/list_ingredients_stock_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'stock_states.dart';

class StockBloc extends Cubit<ListStockState> {
  StockBloc(
    this.listIngredientsUsecase,
  ) : super(EmptyState());

  final ListIngredientUsecase listIngredientsUsecase;
  List<InvetoryIngredient> ingredientsCached = [];

  Future getListStockToState() async {
    final resultEither = await listIngredientsUsecase(NoParams());
    resultEither.fold(
      (failure) {
        emit(FailedState(message: failure.toString()));
      },
      (ingredients) {
        ingredientsCached = ingredients;
        emit(LoadedState(ingredients: ingredientsCached));
      },
    );
  }
}
