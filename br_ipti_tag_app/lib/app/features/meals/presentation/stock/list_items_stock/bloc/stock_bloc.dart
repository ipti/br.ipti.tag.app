import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/inventory_ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/usecases/list_ingredients_stock_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'stock_events.dart';
import 'stock_states.dart';

class StockBloc extends Bloc<ListStockEvent, ListStockState> {
  StockBloc(
    this.listIngredientsUsecase,
  ) : super(EmptyState());

  final ListIngredientUsecase listIngredientsUsecase;
  List<InvetoryIngredient> ingredientsCached = [];

  @override
  Stream<ListStockState> mapEventToState(ListStockEvent event) async* {
    yield LoadingState();
    if (event is GetListStockEvent) {
      yield await _mapGetListStockToState();
    }
  }

  Future<ListStockState> _mapGetListStockToState() async {
    final resultEither = await listIngredientsUsecase(NoParams());
    return resultEither.fold(
      (failure) {
        return FailedState(message: failure.toString());
      },
      (ingredients) {
        ingredientsCached = ingredients;
        return LoadedState(ingredients: ingredientsCached);
      },
    );
  }
}
