import 'package:tag_network/tag_network.dart';

class PostSchoolEndPoint extends EndPointAPI {
  PostSchoolEndPoint(this.params);

  PostSchoolParams params;

  @override
  String get path => '/school';

  @override
  Parameters? get bodyParameters => () => {
        "register_type": params.registerType,
        "inep_id": params.inepId,
        "manager_cpf": params.managerCpf,
        "manager_name": params.managerName,
        "manager_role": params.managerRole,
        "manager_email": params.managerEmail,
        "manager_access_criterion": params.managerAccessCriterion,
        "manager_contract_type": params.managerContractType,
        "situation": params.situation,
        "initial_date": params.initialDate,
        "final_date": params.finalDate,
        "name": params.name,
        "latitude": params.latitude,
        "longitude": params.longitude,
        "cep": params.cep,
        "address": params.address,
        "address_number": params.addressNumber,
        "address_complement": params.addressComplement,
        "address_neighborhood": params.addressNeighborhood,
        "edcenso_uf_fk": {},
        "edcenso_city_fk": {},
        "edcenso_district_fk": {},
        "ddd": params.ddd,
        "phone_number": params.phoneNumber,
        "public_phone_number": params.publicPhoneNumber,
        "other_phone_number": params.otherPhoneNumber,
        "fax_number": params.faxNumber,
        "email": params.email,
        "edcenso_regional_education_organ_fk":
            params.edcensoRegionalEducationOrganFk,
        "administrative_dependence": params.administrativeDependence,
        "location": params.location,
        "id_difflocation": params.idDifflocation,
        "linked_mec": params.linkedMec,
        "linked_army": params.linkedArmy,
        "linked_helth": params.linkedHelth,
        "linked_other": params.linkedOther,
        "private_school_category": params.privateSchoolCategory,
        "public_contract": params.publicContract,
        "private_school_business_or_individual":
            params.privateSchoolBusinessOrIndividual,
        "private_school_syndicate_or_association":
            params.privateSchoolSyndicateOrAssociation,
        "private_school_ong_or_oscip": params.privateSchoolOngOrOscip,
        "private_school_non_profit_institutions":
            params.privateSchoolNonProfitInstitutions,
        "private_school_s_system": params.privateSchoolSSystem,
        "private_school_organization_civil_society":
            params.privateSchoolOrganizationCivilSociety,
        "private_school_maintainer_cnpj": params.privateSchoolMaintainerCnpj,
        "private_school_cnpj": params.privateSchoolCnpj,
        "regulation": params.regulation,
        "regulation_organ": params.regulationOrgan,
        "regulation_organ_federal": params.regulationOrganFederal,
        "regulation_organ_state": params.regulationOrganState,
        "regulation_organ_municipal": params.regulationOrganMunicipal,
        "offer_or_linked_unity": params.offerOrLinkedUnity,
        "inep_head_school": params.inepHeadSchool,
        "ies_code": params.iesCode,
        "logo_file_name": params.logoFileName,
        "logo_file_type": params.logoFileType,
        "logo_file_content": params.logoFileContent,
        "act_of_acknowledgement": params.actOfAcknowledgement,
      };

  @override
  HTTPHeaders? get headers => null;

  @override
  HTTPMethod get httpMethod => HTTPMethod.POST;

  @override
  Parameters? get urlParameters => null;
}

class PostSchoolParams {
  const PostSchoolParams({
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
  final EdcensoFk edcensoUfFk;
  final EdcensoFk edcensoCityFk;
  final EdcensoFk edcensoDistrictFk;
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

class EdcensoFk {
  EdcensoFk();
}
