import 'package:br_ipti_tag_app/app/features/meals/domain/entities/inventory_ingredient.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DetailItemStockState extends Equatable {}

class EmptyState extends DetailItemStockState {
  @override
  List<Object> get props => [];
}

class LoadingState extends DetailItemStockState {
  @override
  List<Object> get props => [];
}

class LoadedState extends DetailItemStockState {
  LoadedState({
    required this.ingredient,
  });

  final InvetoryIngredient ingredient;

  @override
  List<Object> get props => [];
}

class FailedState extends DetailItemStockState {
  FailedState({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
