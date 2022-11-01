import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'stock_events.dart';
import 'stock_states.dart';

class StockBloc extends Bloc<ListStockEvent, ListStockState> {
  StockBloc(
    this.listIngredientsUsecase,
  ) : super(EmptyState()) {
    on<GetListStockEvent>(
      (event, emit) async => emit(await _mapGetListStockToState()),
    );
  }

  final ListIngredientUsecase listIngredientsUsecase;
  List<Ingredient> ingredientsCached = [];

  Future<ListStockState> _mapGetListStockToState() async {
    final resultEither = await listIngredientsUsecase(
      EmptyParams(),
    );

    return resultEither.fold(
      (failure) {
        return FailedState(
          message: failure.toString(),
        );
      },
      (ingredients) {
        ingredientsCached = ingredients;

        return LoadedState(ingredients: ingredientsCached);
      },
    );
  }
}
