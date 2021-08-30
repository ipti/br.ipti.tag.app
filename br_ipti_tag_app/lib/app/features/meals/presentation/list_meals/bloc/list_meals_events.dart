import 'package:equatable/equatable.dart';

abstract class ListMealsEvent extends Equatable {
  const ListMealsEvent();

  @override
  List<Object> get props => [];
}

class GetListMealsEvent extends ListMealsEvent {}

class CleanFilterByTurnEvent extends ListMealsEvent {
  final String turn;
  const CleanFilterByTurnEvent(this.turn);
}

class FilterByTurnEvent extends ListMealsEvent {
  final String turn;
  const FilterByTurnEvent(this.turn);
}

class FilterByStudentTypeEvent extends ListMealsEvent {
  final String studentType;
  const FilterByStudentTypeEvent(this.studentType);
}
