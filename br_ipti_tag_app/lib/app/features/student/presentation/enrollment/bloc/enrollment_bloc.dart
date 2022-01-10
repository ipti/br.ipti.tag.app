import 'package:flutter_bloc/flutter_bloc.dart';

import 'enrollment_states.dart';

class EnrollmentBloc extends Cubit<EnrollmentState> {
  EnrollmentBloc() : super(const EnrollmentState(studentId: ""));

  void setStudent(String? studentId) {
    emit(state.copyWith(studentId: studentId ?? ""));
  }
}
