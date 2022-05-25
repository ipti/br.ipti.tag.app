import 'package:equatable/equatable.dart';

abstract class InstructorFormState extends Equatable {
  const InstructorFormState();
}

class InstructorInitialState extends InstructorFormState {
  const InstructorInitialState();
  @override
  List<Object> get props => [];
}

class InstructorLoadedState extends InstructorFormState {
  @override
  List<Object> get props => [];
}

class InstructorNextTabState extends InstructorFormState {
  final int tabIndex;
  const InstructorNextTabState({
    this.tabIndex = 0,
  });

  @override
  List<Object> get props => [tabIndex];
}

class EnrollmenErrorState extends InstructorFormState {
  final String message;
  const EnrollmenErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class EnrollmenSuccessState extends InstructorFormState {
  final String message;
  const EnrollmenSuccessState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
