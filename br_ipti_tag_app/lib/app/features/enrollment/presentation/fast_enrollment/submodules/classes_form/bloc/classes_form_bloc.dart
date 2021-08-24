import 'package:flutter_bloc/flutter_bloc.dart';

import 'classes_form_events.dart';
import 'classes_form_states.dart';

class ClassesFormBloc extends Bloc<ClassesFormEvent, ClassesFormState> {
  ClassesFormBloc(
    this.initialState,
  ) : super(initialState);

  final ClassesFormState initialState;

  final classesItems = <int, String>{
    1: "Turma 1",
    2: "Turma 2",
  };

  setStudentClass(int value) => add(StudentClassChanged(value));

  @override
  void onTransition(Transition<ClassesFormEvent, ClassesFormState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<ClassesFormState> mapEventToState(ClassesFormEvent event) async* {
    if (event is StudentClassChanged) {
      yield state.copyWith(studentClass: event.classId);
    } else if (event is SubmitClassesForm) {}
  }
}
