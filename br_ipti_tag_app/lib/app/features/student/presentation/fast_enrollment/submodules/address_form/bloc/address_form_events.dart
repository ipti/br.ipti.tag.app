import 'package:equatable/equatable.dart';

abstract class AddressFormEvent extends Equatable {
  const AddressFormEvent();

  @override
  List<Object> get props => [];
}

class StartEditing extends AddressFormEvent {}

class SubmitAddressForm extends AddressFormEvent {}

class SubmitedAddressFormSuccess extends AddressFormEvent {}

class ResidenceZoneChanged extends AddressFormEvent {
  const ResidenceZoneChanged(this.residenceZone);

  final int residenceZone;

  @override
  List<Object> get props => [residenceZone];
}
