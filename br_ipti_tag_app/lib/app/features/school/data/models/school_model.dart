import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';

class SchoolModel extends SchoolEntity {
  SchoolModel({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.registerType,
    super.inepId,
    super.managerCpf,
    super.managerName,
    super.managerRole,
    super.managerEmail,
    super.managerAccessCriterion,
    super.managerContractType,
    super.situation,
    super.initialDate,
    super.finalDate,
    super.name,
    super.latitude,
    super.longitude,
    super.cep,
    super.address,
    super.addressNumber,
    super.addressComplement,
    super.addressNeighborhood,
    super.edcensoUfFk,
    super.edcensoCityFk,
    super.edcensoDistrictFk,
    super.ddd,
    super.phoneNumber,
    super.publicPhoneNumber,
    super.otherPhoneNumber,
    super.faxNumber,
    super.email,
    super.edcensoRegionalEducationOrganFk,
    super.administrativeDependence,
    super.location,
    super.idDifflocation,
    super.linkedMec,
    super.linkedArmy,
    super.linkedHelth,
    super.linkedOther,
    super.privateSchoolCategory,
    super.publicContract,
    super.privateSchoolBusinessOrIndividual,
    super.privateSchoolSyndicateOrAssociation,
    super.privateSchoolOngOrOscip,
    super.privateSchoolNonProfitInstitutions,
    super.privateSchoolSSystem,
    super.privateSchoolOrganizationCivilSociety,
    super.privateSchoolMaintainerCnpj,
    super.privateSchoolCnpj,
    super.regulation,
    super.regulationOrgan,
    super.regulationOrganFederal,
    super.regulationOrganState,
    super.regulationOrganMunicipal,
    super.offerOrLinkedUnity,
    super.inepHeadSchool,
    super.iesCode,
    super.logoFileName,
    super.logoFileType,
    super.logoFileContent,
    super.actOfAcknowledgement,
  });

  @override
  // ignore: long-method
  SchoolModel copyWith({
    String? id,
    String? createdAt,
    String? updatedAt,
    String? registerType,
    String? inepId,
    String? managerCpf,
    String? managerName,
    int? managerRole,
    String? managerEmail,
    String? managerAccessCriterion,
    int? managerContractType,
    int? situation,
    String? initialDate,
    String? finalDate,
    String? name,
    String? latitude,
    String? longitude,
    String? cep,
    String? address,
    String? addressNumber,
    String? addressComplement,
    String? addressNeighborhood,
    String? edcensoUfFk,
    String? edcensoCityFk,
    String? edcensoDistrictFk,
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
    String? logoFileContent,
    String? actOfAcknowledgement,
  }) {
    final schoolModel = SchoolModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      registerType: registerType ?? this.registerType,
      inepId: inepId ?? this.inepId,
      managerCpf: managerCpf ?? this.managerCpf,
      managerName: managerName ?? this.managerName,
      managerRole: managerRole ?? this.managerRole,
      managerEmail: managerEmail ?? this.managerEmail,
      managerAccessCriterion:
          managerAccessCriterion ?? this.managerAccessCriterion,
      managerContractType: managerContractType ?? this.managerContractType,
      situation: situation ?? this.situation,
      initialDate: initialDate ?? this.initialDate,
      finalDate: finalDate ?? this.finalDate,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      cep: cep ?? this.cep,
      address: address ?? this.address,
      addressNumber: addressNumber ?? this.addressNumber,
      addressComplement: addressComplement ?? this.addressComplement,
      addressNeighborhood: addressNeighborhood ?? this.addressNeighborhood,
      edcensoUfFk: edcensoUfFk ?? this.edcensoUfFk,
      edcensoCityFk: edcensoCityFk ?? this.edcensoCityFk,
      edcensoDistrictFk: edcensoDistrictFk ?? this.edcensoDistrictFk,
      ddd: ddd ?? this.ddd,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      publicPhoneNumber: publicPhoneNumber ?? this.publicPhoneNumber,
      otherPhoneNumber: otherPhoneNumber ?? this.otherPhoneNumber,
      faxNumber: faxNumber ?? this.faxNumber,
      email: email ?? this.email,
      edcensoRegionalEducationOrganFk: edcensoRegionalEducationOrganFk ??
          this.edcensoRegionalEducationOrganFk,
      administrativeDependence:
          administrativeDependence ?? this.administrativeDependence,
      location: location ?? this.location,
      idDifflocation: idDifflocation ?? this.idDifflocation,
      linkedMec: linkedMec ?? this.linkedMec,
      linkedArmy: linkedArmy ?? this.linkedArmy,
      linkedHelth: linkedHelth ?? this.linkedHelth,
      linkedOther: linkedOther ?? this.linkedOther,
      privateSchoolCategory:
          privateSchoolCategory ?? this.privateSchoolCategory,
      publicContract: publicContract ?? this.publicContract,
      privateSchoolBusinessOrIndividual: privateSchoolBusinessOrIndividual ??
          this.privateSchoolBusinessOrIndividual,
      privateSchoolSyndicateOrAssociation:
          privateSchoolSyndicateOrAssociation ??
              this.privateSchoolSyndicateOrAssociation,
      privateSchoolOngOrOscip:
          privateSchoolOngOrOscip ?? this.privateSchoolOngOrOscip,
      privateSchoolNonProfitInstitutions: privateSchoolNonProfitInstitutions ??
          this.privateSchoolNonProfitInstitutions,
      privateSchoolSSystem: privateSchoolSSystem ?? this.privateSchoolSSystem,
      privateSchoolOrganizationCivilSociety:
          privateSchoolOrganizationCivilSociety ??
              this.privateSchoolOrganizationCivilSociety,
      privateSchoolMaintainerCnpj:
          privateSchoolMaintainerCnpj ?? this.privateSchoolMaintainerCnpj,
      privateSchoolCnpj: privateSchoolCnpj ?? this.privateSchoolCnpj,
      regulation: regulation ?? this.regulation,
      regulationOrgan: regulationOrgan ?? this.regulationOrgan,
      regulationOrganFederal:
          regulationOrganFederal ?? this.regulationOrganFederal,
      regulationOrganState: regulationOrganState ?? this.regulationOrganState,
      regulationOrganMunicipal:
          regulationOrganMunicipal ?? this.regulationOrganMunicipal,
      offerOrLinkedUnity: offerOrLinkedUnity ?? this.offerOrLinkedUnity,
      inepHeadSchool: inepHeadSchool ?? this.inepHeadSchool,
      iesCode: iesCode ?? this.iesCode,
      logoFileName: logoFileName ?? this.logoFileName,
      logoFileType: logoFileType ?? this.logoFileType,
      logoFileContent: logoFileContent ?? this.logoFileContent,
      actOfAcknowledgement: actOfAcknowledgement ?? this.actOfAcknowledgement,
    );

    return schoolModel;
  }

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map.addAll({
      '_id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    });

    return map;
  }

  // ignore: long-method
  factory SchoolModel.fromMap(Map<String, dynamic> map) {
    final schoolModel = SchoolModel(
      id: map['id'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      registerType: map['register_type'],
      inepId: map['inep_id'],
      managerCpf: map['manager_cpf'],
      managerName: map['manager_name'],
      managerRole: int.tryParse(map['manager_role'] ?? ''),
      managerEmail: map['manager_email'],
      managerAccessCriterion: map['manager_access_criterion'],
      managerContractType: int.tryParse(map['manager_contract_type'] ?? ''),
      situation: int.tryParse(map['situation'] ?? ''),
      initialDate: map['initial_date'],
      finalDate: map['final_date'],
      name: map['name'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      cep: map['cep'],
      address: map['address'],
      addressNumber: map['address_number'],
      addressComplement: map['address_complement'],
      addressNeighborhood: map['address_neighborhood'],
      edcensoUfFk: map['edcenso_uf_fk'],
      edcensoCityFk: map['edcenso_city_fk'],
      edcensoDistrictFk: map['edcenso_district_fk'],
      ddd: map['ddd'],
      phoneNumber: map['phone_number'],
      publicPhoneNumber: map['public_phone_number'],
      otherPhoneNumber: map['other_phone_number'],
      faxNumber: map['fax_number'],
      email: map['email'],
      edcensoRegionalEducationOrganFk:
          map['edcenso_regional_education_organ_fk'],
      administrativeDependence: int.tryParse(
        map['administrative_dependence'] ?? '',
      ),
      location: map['location'],
      idDifflocation: int.tryParse(map['id_difflocation'] ?? ''),
      linkedMec: map['linked_mec'],
      linkedArmy: map['linked_army'],
      linkedHelth: map['linked_helth'],
      linkedOther: map['linked_other'],
      privateSchoolCategory: int.tryParse(map['private_school_category'] ?? ''),
      publicContract: int.tryParse(map['public_contract'] ?? ''),
      privateSchoolBusinessOrIndividual:
          map['private_school_business_or_individual'],
      privateSchoolSyndicateOrAssociation:
          map['private_school_syndicate_or_association'],
      privateSchoolOngOrOscip: map['private_school_ong_or_oscip'],
      privateSchoolNonProfitInstitutions:
          map['private_school_non_profit_institutions'],
      privateSchoolSSystem: map['private_school_s_system'],
      privateSchoolOrganizationCivilSociety:
          map['private_school_organization_civil_society'],
      privateSchoolMaintainerCnpj: map['private_school_maintainer_cnpj'],
      privateSchoolCnpj: map['private_school_cnpj'],
      regulation: int.tryParse(map['regulation'] ?? ''),
      regulationOrgan: int.tryParse(map['regulation_organ'] ?? ''),
      regulationOrganFederal: map['regulation_organ_federal'],
      regulationOrganState: map['regulation_organ_state'],
      regulationOrganMunicipal: map['regulation_organ_municipal'],
      offerOrLinkedUnity: int.tryParse(map['offer_or_linked_unity'] ?? ''),
      inepHeadSchool: map['inep_head_school'],
      iesCode: map['ies_code'],
      logoFileName: map['logo_file_name'],
      logoFileType: map['logo_file_type'],
      logoFileContent: map['logo_file_content'],
      actOfAcknowledgement: map['act_of_acknowledgement'],
    );

    return schoolModel;
  }

  @override
  String toJson() => json.encode(
        toMap(),
      );

  factory SchoolModel.fromJson(String source) => SchoolModel.fromMap(
        json.decode(source),
      );

  @override
  String toString() => '''
SchoolModel(id: $id, registerType: $registerType, inepId: $inepId, managerCpf: $managerCpf, managerName: $managerName, managerRole: $managerRole, managerEmail: $managerEmail, managerAccessCriterion: $managerAccessCriterion, managerContractType: $managerContractType, situation: $situation, initialDate: $initialDate, finalDate: $finalDate, name: $name, latitude: $latitude, longitude: $longitude, cep: $cep, address: $address, addressNumber: $addressNumber, addressComplement: $addressComplement, addressNeighborhood: $addressNeighborhood, edcensoUfFk: $edcensoUfFk, edcensoCityFk: $edcensoCityFk, edcensoDistrictFk: $edcensoDistrictFk, ddd: $ddd, phoneNumber: $phoneNumber, publicPhoneNumber: $publicPhoneNumber, otherPhoneNumber: $otherPhoneNumber, faxNumber: $faxNumber, email: $email, edcensoRegionalEducationOrganFk: $edcensoRegionalEducationOrganFk, administrativeDependence: $administrativeDependence, location: $location, idDifflocation: $idDifflocation, linkedMec: $linkedMec, linkedArmy: $linkedArmy, linkedHelth: $linkedHelth, linkedOther: $linkedOther, privateSchoolCategory: $privateSchoolCategory, publicContract: $publicContract, privateSchoolBusinessOrIndividual: $privateSchoolBusinessOrIndividual, privateSchoolSyndicateOrAssociation: $privateSchoolSyndicateOrAssociation, privateSchoolOngOrOscip: $privateSchoolOngOrOscip, privateSchoolNonProfitInstitutions: $privateSchoolNonProfitInstitutions, privateSchoolSSystem: $privateSchoolSSystem, privateSchoolOrganizationCivilSociety: $privateSchoolOrganizationCivilSociety, privateSchoolMaintainerCnpj: $privateSchoolMaintainerCnpj, privateSchoolCnpj: $privateSchoolCnpj, regulation: $regulation, regulationOrgan: $regulationOrgan, regulationOrganFederal: $regulationOrganFederal, regulationOrganState: $regulationOrganState, regulationOrganMunicipal: $regulationOrganMunicipal, offerOrLinkedUnity: $offerOrLinkedUnity, inepHeadSchool: $inepHeadSchool, iesCode: $iesCode, logoFileName: $logoFileName, logoFileType: $logoFileType, logoFileContent: $logoFileContent, actOfAcknowledgement: $actOfAcknowledgement, createdAt: $createdAt, updatedAt: $updatedAt)''';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SchoolModel &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        super == other;
  }

  @override
  int get hashCode =>
      id.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ super.hashCode;

  // ignore: long-method
  factory SchoolModel.empty() {
    return SchoolModel(
      id: '',
      createdAt: '',
      updatedAt: '',
      registerType: '',
      inepId: '',
      managerCpf: '',
      managerName: '',
      managerRole: -1,
      managerEmail: '',
      managerAccessCriterion: '',
      managerContractType: -1,
      situation: -1,
      initialDate: '',
      finalDate: '',
      name: '',
      latitude: '',
      longitude: '',
      cep: '',
      address: '',
      addressNumber: '',
      addressComplement: '',
      addressNeighborhood: '',
      edcensoUfFk: '',
      edcensoCityFk: '',
      edcensoDistrictFk: '',
      ddd: '',
      phoneNumber: '',
      publicPhoneNumber: '',
      otherPhoneNumber: '',
      faxNumber: '',
      email: '',
      edcensoRegionalEducationOrganFk: '',
      administrativeDependence: -1,
      location: -1,
      idDifflocation: -1,
      linkedMec: false,
      linkedArmy: false,
      linkedHelth: false,
      linkedOther: false,
      privateSchoolCategory: -1,
      publicContract: -1,
      privateSchoolBusinessOrIndividual: false,
      privateSchoolSyndicateOrAssociation: false,
      privateSchoolOngOrOscip: false,
      privateSchoolNonProfitInstitutions: false,
      privateSchoolSSystem: false,
      privateSchoolOrganizationCivilSociety: false,
      privateSchoolMaintainerCnpj: '',
      privateSchoolCnpj: '',
      regulation: -1,
      regulationOrgan: -1,
      regulationOrganFederal: false,
      regulationOrganState: false,
      regulationOrganMunicipal: false,
      offerOrLinkedUnity: -1,
      inepHeadSchool: '',
      iesCode: '',
      logoFileName: '',
      logoFileType: '',
      logoFileContent: '',
      actOfAcknowledgement: '',
    );
  }
}
