import 'package:flutter_bloc/flutter_bloc.dart';

import 'enrollment_events.dart';
import 'enrollment_states.dart';

class EnrollmentBloc extends Bloc<EnrollmentEvent, EnrollmentState> {
  EnrollmentBloc() : super(const EnrollmentState());

  @override
  Stream<EnrollmentState> mapEventToState(EnrollmentEvent event) async* {
    yield state;
  }
}
