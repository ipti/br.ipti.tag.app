import 'package:equatable/equatable.dart';

abstract class ListMealsEvent extends Equatable {
  const ListMealsEvent();

  @override
  List<Object> get props => [];
}

class GetListMealsEvent extends ListMealsEvent {}

class CleanFilterByTurnEvent extends ListMealsEvent {
  const CleanFilterByTurnEvent(this.turn);
  final String turn;
}

class FilterByTurnEvent extends ListMealsEvent {
  const FilterByTurnEvent(this.turn);
  final String turn;
}

class FilterByStudentTypeEvent extends ListMealsEvent {
  const FilterByStudentTypeEvent(this.studentType);
  final String studentType;
}
