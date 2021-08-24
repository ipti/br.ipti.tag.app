import 'package:equatable/equatable.dart';

abstract class ClassroomListEvent extends Equatable {
  const ClassroomListEvent();

  @override
  List<Object> get props => [];
}

class GetListClassroomsEvent extends ClassroomListEvent {}
