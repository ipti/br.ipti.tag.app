import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:tag_sdk/tag_sdk.dart';

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
    required this.mealsOfDay,
  });

  final List<MealsMenu> mealsOfDay;

  @override
  List<Object> get props => [];
}

class FailedState extends ListMealsState {
  FailedState({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
