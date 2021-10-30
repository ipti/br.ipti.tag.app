import 'package:flutter_bloc/flutter_bloc.dart';

import 'enrollment_social_states.dart';

class EnrollmentSocialBloc extends Cubit<EnrollmentSocialState> {
  EnrollmentSocialBloc()
      : super(
          const EmptyEnrollmentSocialState(),
        );

  // Social
  void setNis(String value) => emit(state.copyWith(
        nis: value,
      ));

  void setInepId(String value) => emit(state.copyWith(
        inepId: value,
      ));

  void setBfParticipator({bool value = false}) => emit(state.copyWith(
        bfParticipator: value,
      ));

  Future<void> submitPersonalForm() async {}
}
