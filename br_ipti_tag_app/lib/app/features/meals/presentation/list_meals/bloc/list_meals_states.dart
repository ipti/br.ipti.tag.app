import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_menu.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ListMealsState extends Equatable {}

class EmptyState extends ListMealsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ListMealsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ListMealsState {
  LoadedState({
    @required this.mealsOfDay,
  });

  final List<MealsMenu> mealsOfDay;

  @override
  List<Object> get props => [];
}

class FailedState extends ListMealsState {
  FailedState({
    @required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
