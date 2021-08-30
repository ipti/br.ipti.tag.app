import 'package:flutter_bloc/flutter_bloc.dart';

import 'address_form_events.dart';
import 'address_form_states.dart';

class AddressFormBloc extends Bloc<AddressFormEvent, AddressFormState> {
  AddressFormBloc(
    this.initialState,
  ) : super(initialState);

  final AddressFormState initialState;

  final residenceZoneItems = <int, String>{
    1: "URBANA",
    2: "RURAL",
  };

  void setResidenceZone(int value) => add(ResidenceZoneChanged(value));

  @override
  void onTransition(Transition<AddressFormEvent, AddressFormState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<AddressFormState> mapEventToState(AddressFormEvent event) async* {
    if (event is ResidenceZoneChanged) {
      yield state.copyWith(residenceZone: event.residenceZone);
    } else if (event is SubmitAddressForm) {}
  }
}
