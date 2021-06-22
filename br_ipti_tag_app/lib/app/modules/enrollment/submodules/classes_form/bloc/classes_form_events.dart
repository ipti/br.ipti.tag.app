import 'package:equatable/equatable.dart';

abstract class ClassesFormEvent extends Equatable {
  const ClassesFormEvent();

  @override
  List<Object> get props => [];
}

class StartEditing extends ClassesFormEvent {}

class SubmitClassesForm extends ClassesFormEvent {}

class SubmitedClassesFormSuccess extends ClassesFormEvent {}

class StudentClassChanged extends ClassesFormEvent {
  const StudentClassChanged(this.classId);

  final int classId;

  @override
  List<Object> get props => [classId];
}
