import 'package:flutter_bloc/flutter_bloc.dart';

import 'instructor_states.dart';

class CreateInstructorBloc extends Cubit<InstructorFormState> {
  CreateInstructorBloc() : super(const InstructorInitialState());

  int tabIndex = 0;

  // ignore: use_setters_to_change_properties
  void setTabIndex(int index) {
    tabIndex = index;
  }

  void nextTab() {
    emit(InstructorNextTabState(
      tabIndex: tabIndex + 1,
    ));
  }

  void notifyError(String message) {
    emit(EnrollmenErrorState(message: message));
  }

  void notifySuccess(String message) {
    emit(EnrollmenSuccessState(message: message));
  }
}
