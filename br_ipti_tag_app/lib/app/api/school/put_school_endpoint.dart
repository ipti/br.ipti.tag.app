import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_headers.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/school.dart';

class PutSchoolEndPoint extends EndPointAPI {
  final String schoolId;
  final SchoolDto schoolDto;
  PutSchoolEndPoint(this.schoolId, this.schoolDto);

  @override
  String get path => "/school/$schoolId";

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  HTTPHeaders? get headers => () => {
        'Content-Type': ContentType.APPLICATION_JSON,
      };

  @override
  Parameters? get bodyParameters => null;

  @override
  Parameters? get urlParameters => null;
}

class SchoolDto {
  SchoolDto({
    required this.registerType,
    required this.inepId,
    required this.managerCpf,
    required this.managerName,
    required this.managerRole,
    required this.managerEmail,
    required this.managerAccessCriterion,
    required this.managerContractType,
    required this.situation,
    required this.initialDate,
    required this.finalDate,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.cep,
    required this.address,
    required this.addressNumber,
    required this.addressComplement,
    required this.addressNeighborhood,
    required this.edcensoUfFk,
    required this.edcensoCityFk,
    required this.edcensoDistrictFk,
    required this.ddd,
    required this.phoneNumber,
    required this.publicPhoneNumber,
    required this.otherPhoneNumber,
    required this.faxNumber,
    required this.email,
    required this.edcensoRegionalEducationOrganFk,
    required this.administrativeDependence,
    required this.location,
    required this.idDifflocation,
    required this.linkedMec,
    required this.linkedArmy,
    required this.linkedHelth,
    required this.linkedOther,
    required this.privateSchoolCategory,
    required this.publicContract,
    required this.privateSchoolBusinessOrIndividual,
    required this.privateSchoolSyndicateOrAssociation,
    required this.privateSchoolOngOrOscip,
    required this.privateSchoolNonProfitInstitutions,
    required this.privateSchoolSSystem,
    required this.privateSchoolOrganizationCivilSociety,
    required this.privateSchoolMaintainerCnpj,
    required this.privateSchoolCnpj,
    required this.regulation,
    required this.regulationOrgan,
    required this.regulationOrganFederal,
    required this.regulationOrganState,
    required this.regulationOrganMunicipal,
    required this.offerOrLinkedUnity,
    required this.inepHeadSchool,
    required this.iesCode,
    required this.logoFileName,
    required this.logoFileType,
    required this.logoFileContent,
    required this.actOfAcknowledgement,
    required this.createdAt,
    required this.updatedAt,
  });
  final String registerType;
  final String inepId;
  final String managerCpf;
  final String managerName;
  final int managerRole;
  final String managerEmail;
  final String managerAccessCriterion;
  final int managerContractType;
  final int situation;
  final String initialDate;
  final String finalDate;
  final String name;
  final String latitude;
  final String longitude;
  final String cep;
  final String address;
  final String addressNumber;
  final String addressComplement;
  final String addressNeighborhood;
  final String edcensoUfFk;
  final String edcensoCityFk;
  final String edcensoDistrictFk;
  final String ddd;
  final String phoneNumber;
  final String publicPhoneNumber;
  final String otherPhoneNumber;
  final String faxNumber;
  final String email;
  final String edcensoRegionalEducationOrganFk;
  final int administrativeDependence;
  final int location;
  final int idDifflocation;
  final bool linkedMec;
  final bool linkedArmy;
  final bool linkedHelth;
  final bool linkedOther;
  final int privateSchoolCategory;
  final int publicContract;
  final bool privateSchoolBusinessOrIndividual;
  final bool privateSchoolSyndicateOrAssociation;
  final bool privateSchoolOngOrOscip;
  final bool privateSchoolNonProfitInstitutions;
  final bool privateSchoolSSystem;
  final bool privateSchoolOrganizationCivilSociety;
  final String privateSchoolMaintainerCnpj;
  final String privateSchoolCnpj;
  final int regulation;
  final int regulationOrgan;
  final bool regulationOrganFederal;
  final bool regulationOrganState;
  final bool regulationOrganMunicipal;
  final int offerOrLinkedUnity;
  final String inepHeadSchool;
  final String iesCode;
  final String logoFileName;
  final String logoFileType;
  final String logoFileContent;
  final String actOfAcknowledgement;
  final String createdAt;
  final String updatedAt;
}
