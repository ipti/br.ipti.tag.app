import 'package:equatable/equatable.dart';

class AddressFormState extends Equatable {
  const AddressFormState({
    this.residenceZone,
  });

  final int? residenceZone;

  AddressFormState copyWith({
    int? residenceZone,
  }) {
    return AddressFormState(
      residenceZone: residenceZone ?? this.residenceZone,
    );
  }

  @override
  List<Object?> get props => [residenceZone];
}
