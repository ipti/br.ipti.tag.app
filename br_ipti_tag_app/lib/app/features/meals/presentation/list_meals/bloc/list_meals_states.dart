import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_of_day.dart';
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
  final List<MealsOfDay> mealsOfDay;

  LoadedState({
    @required this.mealsOfDay,
  });

  @override
  List<Object> get props => [];
}

class FailedState extends ListMealsState {
  final String message;

  FailedState({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}
