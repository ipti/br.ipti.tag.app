import 'package:equatable/equatable.dart';

class EnrollmentAddressState extends Equatable {
  final Map<String, String> cities;
  final Map<String, String> ufs;

  final String cep;
  final String address;
  final String number;
  final String complement;
  final int residenceZone;
  final String neighborhood;
  final String edcensoUfFk;
  final String edcensoCityFk;

  const EnrollmentAddressState({
    required this.cities,
    required this.ufs,
    required this.cep,
    required this.address,
    required this.number,
    required this.complement,
    required this.neighborhood,
    required this.edcensoUfFk,
    required this.edcensoCityFk,
    required this.residenceZone,
  });

  @override
  List<Object> get props {
    return [
      cep,
      address,
      number,
      complement,
      neighborhood,
      edcensoUfFk,
      edcensoCityFk,
      residenceZone,
      cities.toString(),
      ufs.toString(),
    ];
  }

  EnrollmentAddressState copyWith({
    String? cep,
    String? address,
    String? number,
    String? complement,
    String? neighborhood,
    String? edcensoUfFk,
    String? edcensoCityFk,
    int? residenceZone,
    Map<String, String>? cities,
    Map<String, String>? ufs,
  }) {
    return EnrollmentAddressState(
      cep: cep ?? this.cep,
      address: address ?? this.address,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      neighborhood: neighborhood ?? this.neighborhood,
      edcensoUfFk: edcensoUfFk ?? this.edcensoUfFk,
      edcensoCityFk: edcensoCityFk ?? this.edcensoCityFk,
      residenceZone: residenceZone ?? this.residenceZone,
      cities: cities ?? this.cities,
      ufs: ufs ?? this.ufs,
    );
  }
}

class EmptyEnrollmentAddressState extends EnrollmentAddressState {
  const EmptyEnrollmentAddressState()
      : super(
          cep: "",
          address: "",
          complement: "",
          edcensoCityFk: "",
          edcensoUfFk: "",
          neighborhood: "",
          number: "",
          residenceZone: 0,
          cities: const {},
          ufs: const {},
        );
}
