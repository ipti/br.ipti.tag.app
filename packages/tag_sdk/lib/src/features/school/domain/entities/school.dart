import 'package:freezed_annotation/freezed_annotation.dart';

import 'logo_file_content.dart';

part 'school.freezed.dart';
part 'school.g.dart';

@freezed
class School with _$School {
  const factory School({
    required String registerType,
    required String inepId,
    String? managerCpf,
    String? managerName,
    int? managerRole,
    String? managerEmail,
    String? managerAccessCriterion,
    int? managerContractType,
    required int situation,
    String? initialDate,
    String? finalDate,
    required String name,
    String? latitude,
    String? longitude,
    String? cep,
    String? address,
    String? addressNumber,
    String? addressComplement,
    String? addressNeighborhood,
    required int edcensoUfFk,
    required int edcensoCityFk,
    required int edcensoDistrictFk,
    String? ddd,
    String? phoneNumber,
    String? publicPhoneNumber,
    String? otherPhoneNumber,
    String? faxNumber,
    String? email,
    String? edcensoRegionalEducationOrganFk,
    int? administrativeDependence,
    int? location,
    int? idDifflocation,
    bool? linkedMec,
    bool? linkedArmy,
    bool? linkedHelth,
    bool? linkedOther,
    int? privateSchoolCategory,
    int? publicContract,
    bool? privateSchoolBusinessOrIndividual,
    bool? privateSchoolSyndicateOrAssociation,
    bool? privateSchoolOngOrOscip,
    bool? privateSchoolNonProfitInstitutions,
    bool? privateSchoolSSystem,
    bool? privateSchoolOrganizationCivilSociety,
    String? privateSchoolMaintainerCnpj,
    String? privateSchoolCnpj,
    int? regulation,
    int? regulationOrgan,
    bool? regulationOrganFederal,
    bool? regulationOrganState,
    bool? regulationOrganMunicipal,
    int? offerOrLinkedUnity,
    String? inepHeadSchool,
    String? iesCode,
    String? logoFileName,
    String? logoFileType,
    LogoFileContent? logoFileContent,
    String? actOfAcknowledgement,
  }) = _School;

  factory School.fromJson(Map<String, Object?> json) => _$SchoolFromJson(json);
}
