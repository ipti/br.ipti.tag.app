import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
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
  final String? edcensoCityFk;

  final String nis;
  final String inepId;
  final bool bfParticipator;
  final bool posCenso;
  final StudentDocsAddress? docsAddress;

  const EnrollmentAddressState({
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
    required this.nis,
    required this.inepId,
    required this.bfParticipator,
    required this.posCenso,
    this.docsAddress,
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
      edcensoCityFk ?? "",
      residenceZone,
      nis,
      inepId,
      bfParticipator,
      posCenso,
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
    String? nis,
    String? inepId,
    bool? bfParticipator,
    bool? posCenso,
    Map<String, String>? cities,
    Map<String, String>? ufs,
    StudentDocsAddress? docsAddress,
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
      nis: nis ?? this.nis,
      inepId: inepId ?? this.inepId,
      bfParticipator: bfParticipator ?? this.bfParticipator,
      posCenso: posCenso ?? this.posCenso,
      cities: cities ?? this.cities,
      ufs: ufs ?? this.ufs,
      docsAddress: docsAddress ?? this.docsAddress,
    );
  }
}

class EmptyEnrollmentAddressState extends EnrollmentAddressState {
  const EmptyEnrollmentAddressState()
      : super(
          cep: "",
          address: "",
          complement: "",
          edcensoCityFk: null,
          edcensoUfFk: "",
          neighborhood: "",
          number: "",
          residenceZone: 0,
          nis: "",
          inepId: "",
          bfParticipator: false,
          posCenso: false,
          cities: const {},
          ufs: const {},
        );
}
