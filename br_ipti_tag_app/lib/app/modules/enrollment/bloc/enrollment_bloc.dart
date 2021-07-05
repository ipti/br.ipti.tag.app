import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_events.dart';
import 'enrollment_states.dart';

class EnrollmentBloc extends Bloc<EnrollmentEvent, EnrollmentState> {
  EnrollmentBloc() : super(const EnrollmentState());

  @override
  Stream<EnrollmentState> mapEventToState(EnrollmentEvent event) async* {
    yield state;
  }

  tabNavigation(index) {
    switch (index) {
      case 0:
        Modular.to.navigate('../personal');
        break;
      case 1:
        Modular.to.navigate('../address');
        break;
      case 2:
        Modular.to.navigate('../classes');
        break;
      default:
    }
  }
}
