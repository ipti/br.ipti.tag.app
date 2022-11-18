import 'package:equatable/equatable.dart';
import 'package:tag_sdk/tag_sdk.dart';

class InstructorAddressState extends Equatable {
  final Map<int, String> cities;
  final Map<int, String> ufs;

  final String cep;
  final String address;
  final String number;
  final String complement;
  final int residenceZone;
  final String neighborhood;
  final int? edcensoUfFk;
  final int? edcensoCityFk;

  const InstructorAddressState({
    required this.cities,
    required this.ufs,
    required this.cep,
    required this.address,
    required this.number,
    required this.complement,
    required this.neighborhood,
    required this.edcensoUfFk,
    this.edcensoCityFk,
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
      edcensoUfFk ?? "",
      edcensoCityFk ?? "",
      residenceZone,
      cities.hashCode,
      ufs.hashCode,
    ];
  }

  InstructorAddressState copyWith({
    String? cep,
    String? address,
    String? number,
    String? complement,
    String? neighborhood,
    int? edcensoUfFk,
    int? edcensoCityFk,
    int? residenceZone,
    String? nis,
    String? inepId,
    bool? bfParticipator,
    bool? posCenso,
    Map<int, String>? cities,
    Map<int, String>? ufs,
    StudentDocsAndAddress? docsAddress,
  }) {
    return InstructorAddressState(
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

class EmptyInstructorAddressState extends InstructorAddressState {
  const EmptyInstructorAddressState()
      : super(
          cep: "",
          address: "",
          complement: "",
          edcensoCityFk: null,
          edcensoUfFk: null,
          neighborhood: "",
          number: "",
          residenceZone: 1,
          cities: const {},
          ufs: const {},
        );
}
