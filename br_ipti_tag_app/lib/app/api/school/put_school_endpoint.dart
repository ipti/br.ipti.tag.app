import 'package:br_ipti_tag_app/app/api/school/dto/school_update.dto.dart';
import 'package:br_ipti_tag_app/app/core/network/end_point/endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_headers.dart';
import 'package:br_ipti_tag_app/app/core/network/manager/http_method.dart';

class PutSchoolEndPoint extends EndPointAPI {
  PutSchoolEndPoint(
    this.schoolId,
    this.schoolDto,
  );

  final String schoolId;
  final SchoolUpdateDto schoolDto;

  @override
  String get path => "/school/$schoolId";

  @override
  HTTPMethod get httpMethod => HTTPMethod.PUT;

  @override
  HTTPHeaders? get headers => () => {
        'Content-Type': ContentType.APPLICATION_FORM,
      };

  @override
  Parameters? get bodyParameters => () => {
        "name": schoolDto.name,
        "register_type": schoolDto.registerType,
        "inep_id": schoolDto.inepId,
        "manager_cpf": schoolDto.managerCpf,
        "manager_name": schoolDto.managerName,
        "manager_role": schoolDto.managerRole,
        "manager_email": schoolDto.managerEmail,
        "manager_access_criterion": schoolDto.managerAccessCriterion,
        "manager_contract_type": schoolDto.managerContractType,
        "situation": schoolDto.situation,
        "initial_date": schoolDto.initialDate,
        "final_date": schoolDto.finalDate,
        "latitude": schoolDto.latitude,
        "longitude": schoolDto.longitude,
        "cep": schoolDto.cep,
        "address": schoolDto.address,
        "address_number": schoolDto.addressNumber,
        "address_complement": schoolDto.addressComplement,
        "address_neighborhood": schoolDto.addressNeighborhood,
        "edcenso_uf_fk": {},
        "edcenso_city_fk": {},
        "edcenso_district_fk": {},
        "ddd": schoolDto.ddd,
        "phone_number": schoolDto.phoneNumber,
        "public_phone_number": schoolDto.publicPhoneNumber,
        "other_phone_number": schoolDto.otherPhoneNumber,
        "fax_number": schoolDto.faxNumber,
        "email": schoolDto.email,
        "edcenso_regional_education_organ_fk":
            schoolDto.edcensoRegionalEducationOrganFk,
        "administrative_dependence": schoolDto.administrativeDependence,
        "location": schoolDto.location,
        "id_difflocation": schoolDto.idDifflocation,
        "linked_mec": schoolDto.linkedMec,
        "linked_army": schoolDto.linkedArmy,
        "linked_helth": schoolDto.linkedHelth,
        "linked_other": schoolDto.linkedOther,
        "private_school_category": schoolDto.privateSchoolCategory,
        "public_contract": schoolDto.publicContract,
        "private_school_business_or_individual":
            schoolDto.privateSchoolBusinessOrIndividual,
        "private_school_syndicate_or_association":
            schoolDto.privateSchoolSyndicateOrAssociation,
        "private_school_ong_or_oscip": schoolDto.privateSchoolOngOrOscip,
        "private_school_non_profit_institutions":
            schoolDto.privateSchoolNonProfitInstitutions,
        "private_school_s_system": schoolDto.privateSchoolSSystem,
        "private_school_organization_civil_society":
            schoolDto.privateSchoolOrganizationCivilSociety,
        "private_school_maintainer_cnpj": schoolDto.privateSchoolMaintainerCnpj,
        "private_school_cnpj": schoolDto.privateSchoolCnpj,
        "regulation": schoolDto.regulation,
        "regulation_organ": schoolDto.regulationOrgan,
        "regulation_organ_federal": schoolDto.regulationOrganFederal,
        "regulation_organ_state": schoolDto.regulationOrganState,
        "regulation_organ_municipal": schoolDto.regulationOrganMunicipal,
        "offer_or_linked_unity": schoolDto.offerOrLinkedUnity,
        "inep_head_school": schoolDto.inepHeadSchool,
        "ies_code": schoolDto.iesCode,
        "logo_file_name": schoolDto.logoFileName,
        "logo_file_type": schoolDto.logoFileType,
        "logo_file_content": schoolDto.logoFileContent,
        "act_of_acknowledgement": schoolDto.actOfAcknowledgement,
      };
  @override
  Parameters? get urlParameters => null;
}
