import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/inventory_ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/usecases/get_item_stock_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_item_stock_states.dart';

class DetailItemStockBloc extends Cubit<DetailItemStockState> {
  DetailItemStockBloc(
    this.listIngredientsUsecase,
  ) : super(EmptyState());

  final GetItemStockUsecase listIngredientsUsecase;
  late InvetoryIngredient ingredientsCached;

  Future getItemStock(String objectId) async {
    final resultEither = await listIngredientsUsecase(
      IdParams(objectId: objectId),
    );

    resultEither.fold(
      (failure) {
        emit(FailedState(message: failure.toString()));
      },
      (ingredient) {
        ingredientsCached = ingredient;
        emit(LoadedState(ingredient: ingredientsCached));
      },
    );
  }
}
