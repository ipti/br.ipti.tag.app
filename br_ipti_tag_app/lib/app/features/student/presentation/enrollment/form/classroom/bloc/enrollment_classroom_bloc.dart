import 'package:flutter_bloc/flutter_bloc.dart';

import 'enrollment_classroom_states.dart';

class EnrollmentClassroomBloc extends Cubit<EnrollmentClassroomState> {
  EnrollmentClassroomBloc() : super(const EmptyEnrollmentClassroomState());

  final classesItems = <String, String>{
    "1": "Turma 1",
    "2": "Turma 2",
  };

  // Turma
  void setStudentClass(String classroomid) => emit(
        state.copyWith(classroomId: classroomid),
      );
}
