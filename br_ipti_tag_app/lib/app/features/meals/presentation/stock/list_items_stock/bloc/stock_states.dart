import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListStockState extends Equatable {}

class EmptyState extends ListStockState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ListStockState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ListStockState {
  LoadedState({
    @required this.ingredients,
  });

  final List<Ingredient> ingredients;

  @override
  List<Object> get props => [];
}

class FailedState extends ListStockState {
  FailedState({
    @required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
