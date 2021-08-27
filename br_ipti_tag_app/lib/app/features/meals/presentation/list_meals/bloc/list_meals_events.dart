import 'package:equatable/equatable.dart';

abstract class ListMealsEvent extends Equatable {
  const ListMealsEvent();

  @override
  List<Object> get props => [];
}

class GetListMealsEvent extends ListMealsEvent {}

class CleanFilterByTurnEvent extends ListMealsEvent {
  final String turn;
  CleanFilterByTurnEvent(this.turn);
}

class FilterByTurnEvent extends ListMealsEvent {
  final String turn;
  FilterByTurnEvent(this.turn);
}

class FilterByStudentTypeEvent extends ListMealsEvent {
  final String studentType;
  FilterByStudentTypeEvent(this.studentType);
}
