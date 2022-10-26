import 'dart:convert';

class SchoolEntity {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? registerType;
  String? inepId;
  String? managerCpf;
  String? managerName;
  int? managerRole;
  String? managerEmail;
  String? managerAccessCriterion;
  int? managerContractType;
  int? situation;
  String? initialDate;
  String? finalDate;
  String? name;
  String? latitude;
  String? longitude;
  String? cep;
  String? address;
  String? addressNumber;
  String? addressComplement;
  String? addressNeighborhood;
  int? edcensoUfFk;
  int? edcensoCityFk;
  int? edcensoDistrictFk;
  String? ddd;
  String? phoneNumber;
  String? publicPhoneNumber;
  String? otherPhoneNumber;
  String? faxNumber;
  String? email;
  String? edcensoRegionalEducationOrganFk;
  int? administrativeDependence;
  int? location;
  int? idDifflocation;
  bool? linkedMec;
  bool? linkedArmy;
  bool? linkedHelth;
  bool? linkedOther;
  int? privateSchoolCategory;
  int? publicContract;
  bool? privateSchoolBusinessOrIndividual;
  bool? privateSchoolSyndicateOrAssociation;
  bool? privateSchoolOngOrOscip;
  bool? privateSchoolNonProfitInstitutions;
  bool? privateSchoolSSystem;
  bool? privateSchoolOrganizationCivilSociety;
  String? privateSchoolMaintainerCnpj;
  String? privateSchoolCnpj;
  int? regulation;
  int? regulationOrgan;
  bool? regulationOrganFederal;
  bool? regulationOrganState;
  bool? regulationOrganMunicipal;
  int? offerOrLinkedUnity;
  String? inepHeadSchool;
  String? iesCode;
  String? logoFileName;
  String? logoFileType;
  String? logoFileContent;
  String? actOfAcknowledgement;
  SchoolEntity({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.registerType,
    this.inepId,
    this.managerCpf,
    this.managerName,
    this.managerRole,
    this.managerEmail,
    this.managerAccessCriterion,
    this.managerContractType,
    this.situation,
    this.initialDate,
    this.finalDate,
    this.name,
    this.latitude,
    this.longitude,
    this.cep,
    this.address,
    this.addressNumber,
    this.addressComplement,
    this.addressNeighborhood,
    this.edcensoUfFk,
    this.edcensoCityFk,
    this.edcensoDistrictFk,
    this.ddd,
    this.phoneNumber,
    this.publicPhoneNumber,
    this.otherPhoneNumber,
    this.faxNumber,
    this.email,
    this.edcensoRegionalEducationOrganFk,
    this.administrativeDependence,
    this.location,
    this.idDifflocation,
    this.linkedMec,
    this.linkedArmy,
    this.linkedHelth,
    this.linkedOther,
    this.privateSchoolCategory,
    this.publicContract,
    this.privateSchoolBusinessOrIndividual,
    this.privateSchoolSyndicateOrAssociation,
    this.privateSchoolOngOrOscip,
    this.privateSchoolNonProfitInstitutions,
    this.privateSchoolSSystem,
    this.privateSchoolOrganizationCivilSociety,
    this.privateSchoolMaintainerCnpj,
    this.privateSchoolCnpj,
    this.regulation,
    this.regulationOrgan,
    this.regulationOrganFederal,
    this.regulationOrganState,
    this.regulationOrganMunicipal,
    this.offerOrLinkedUnity,
    this.inepHeadSchool,
    this.iesCode,
    this.logoFileName,
    this.logoFileType,
    this.logoFileContent,
    this.actOfAcknowledgement,
  });

  // ignore: long-method
  SchoolEntity copyWith({
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
    int? edcensoUfFk,
    int? edcensoCityFk,
    int? edcensoDistrictFk,
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
    return SchoolEntity(
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
  }

  // ignore: long-method
  Map<String, dynamic> toMap() {
    return {
      'register_type': registerType,
      'inep_id': inepId,
      'manager_cpf': managerCpf,
      'manager_name': managerName,
      'manager_role': managerRole,
      'manager_email': managerEmail,
      'manager_access_criterion': managerAccessCriterion,
      'manager_contract_type': managerContractType,
      'situation': situation,
      'initial_date': initialDate,
      'final_date': finalDate,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'cep': cep,
      'address': address,
      'address_number': addressNumber,
      'address_complement': addressComplement,
      'address_neighborhood': addressNeighborhood,
      'edcenso_uf_fk': edcensoUfFk,
      'edcenso_city_fk': edcensoCityFk,
      'edcenso_district_fk': edcensoDistrictFk,
      'ddd': ddd,
      'phone_number': phoneNumber,
      'public_phone_number': publicPhoneNumber,
      'other_phone_number': otherPhoneNumber,
      'fax_number': faxNumber,
      'email': email,
      'edcenso_regional_education_organ_fk': edcensoRegionalEducationOrganFk,
      'administrative_dependence': administrativeDependence,
      'location': location,
      'id_difflocation': idDifflocation,
      'linked_mec': linkedMec,
      'linked_army': linkedArmy,
      'linked_helth': linkedHelth,
      'linked_other': linkedOther,
      'private_school_category': privateSchoolCategory,
      'public_contract': publicContract,
      'private_school_business_or_individual':
          privateSchoolBusinessOrIndividual,
      'private_school_syndicate_or_association':
          privateSchoolSyndicateOrAssociation,
      'private_school_ong_or_oscip': privateSchoolOngOrOscip,
      'private_school_non_profit_institutions':
          privateSchoolNonProfitInstitutions,
      'private_school_s_system': privateSchoolSSystem,
      'private_school_organization_civil_society':
          privateSchoolOrganizationCivilSociety,
      'private_school_maintainer_cnpj': privateSchoolMaintainerCnpj,
      'private_school_cnpj': privateSchoolCnpj,
      'regulation': regulation,
      'regulation_organ': regulationOrgan,
      'regulation_organ_federal': regulationOrganFederal,
      'regulation_organ_state': regulationOrganState,
      'regulation_organ_municipal': regulationOrganMunicipal,
      'offer_or_linked_unity': offerOrLinkedUnity,
      'inep_head_school': inepHeadSchool,
      'ies_code': iesCode,
      'logo_file_name': logoFileName,
      'logo_file_type': logoFileType,
      'logo_file_content': logoFileContent,
      'act_of_acknowledgement': actOfAcknowledgement,
    };
  }

  // ignore: long-method
  factory SchoolEntity.fromMap(Map<String, dynamic> map) {
    return SchoolEntity(
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
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory SchoolEntity.fromJson(String source) => SchoolEntity.fromMap(
        json.decode(source),
      );

  @override
  String toString() {
    return '''
SchoolEntity(registerType: $registerType, inepId: $inepId, managerCpf: $managerCpf, managerName: $managerName, managerRole: $managerRole, managerEmail: $managerEmail, managerAccessCriterion: $managerAccessCriterion, managerContractType: $managerContractType, situation: $situation, initialDate: $initialDate, finalDate: $finalDate, name: $name, latitude: $latitude, longitude: $longitude, cep: $cep, address: $address, addressNumber: $addressNumber, addressComplement: $addressComplement, addressNeighborhood: $addressNeighborhood, edcensoUfFk: $edcensoUfFk, edcensoCityFk: $edcensoCityFk, edcensoDistrictFk: $edcensoDistrictFk, ddd: $ddd, phoneNumber: $phoneNumber, publicPhoneNumber: $publicPhoneNumber, otherPhoneNumber: $otherPhoneNumber, faxNumber: $faxNumber, email: $email, edcensoRegionalEducationOrganFk: $edcensoRegionalEducationOrganFk, administrativeDependence: $administrativeDependence, location: $location, idDifflocation: $idDifflocation, linkedMec: $linkedMec, linkedArmy: $linkedArmy, linkedHelth: $linkedHelth, linkedOther: $linkedOther, privateSchoolCategory: $privateSchoolCategory, publicContract: $publicContract, privateSchoolBusinessOrIndividual: $privateSchoolBusinessOrIndividual, privateSchoolSyndicateOrAssociation: $privateSchoolSyndicateOrAssociation, privateSchoolOngOrOscip: $privateSchoolOngOrOscip, privateSchoolNonProfitInstitutions: $privateSchoolNonProfitInstitutions, privateSchoolSSystem: $privateSchoolSSystem, privateSchoolOrganizationCivilSociety: $privateSchoolOrganizationCivilSociety, privateSchoolMaintainerCnpj: $privateSchoolMaintainerCnpj, privateSchoolCnpj: $privateSchoolCnpj, regulation: $regulation, regulationOrgan: $regulationOrgan, regulationOrganFederal: $regulationOrganFederal, regulationOrganState: $regulationOrganState, regulationOrganMunicipal: $regulationOrganMunicipal, offerOrLinkedUnity: $offerOrLinkedUnity, inepHeadSchool: $inepHeadSchool, iesCode: $iesCode, logoFileName: $logoFileName, logoFileType: $logoFileType, logoFileContent: $logoFileContent, actOfAcknowledgement: $actOfAcknowledgement)''';
  }

  @override
  // ignore: long-method
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SchoolEntity &&
        other.registerType == registerType &&
        other.inepId == inepId &&
        other.managerCpf == managerCpf &&
        other.managerName == managerName &&
        other.managerRole == managerRole &&
        other.managerEmail == managerEmail &&
        other.managerAccessCriterion == managerAccessCriterion &&
        other.managerContractType == managerContractType &&
        other.situation == situation &&
        other.initialDate == initialDate &&
        other.finalDate == finalDate &&
        other.name == name &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.cep == cep &&
        other.address == address &&
        other.addressNumber == addressNumber &&
        other.addressComplement == addressComplement &&
        other.addressNeighborhood == addressNeighborhood &&
        other.edcensoUfFk == edcensoUfFk &&
        other.edcensoCityFk == edcensoCityFk &&
        other.edcensoDistrictFk == edcensoDistrictFk &&
        other.ddd == ddd &&
        other.phoneNumber == phoneNumber &&
        other.publicPhoneNumber == publicPhoneNumber &&
        other.otherPhoneNumber == otherPhoneNumber &&
        other.faxNumber == faxNumber &&
        other.email == email &&
        other.edcensoRegionalEducationOrganFk ==
            edcensoRegionalEducationOrganFk &&
        other.administrativeDependence == administrativeDependence &&
        other.location == location &&
        other.idDifflocation == idDifflocation &&
        other.linkedMec == linkedMec &&
        other.linkedArmy == linkedArmy &&
        other.linkedHelth == linkedHelth &&
        other.linkedOther == linkedOther &&
        other.privateSchoolCategory == privateSchoolCategory &&
        other.publicContract == publicContract &&
        other.privateSchoolBusinessOrIndividual ==
            privateSchoolBusinessOrIndividual &&
        other.privateSchoolSyndicateOrAssociation ==
            privateSchoolSyndicateOrAssociation &&
        other.privateSchoolOngOrOscip == privateSchoolOngOrOscip &&
        other.privateSchoolNonProfitInstitutions ==
            privateSchoolNonProfitInstitutions &&
        other.privateSchoolSSystem == privateSchoolSSystem &&
        other.privateSchoolOrganizationCivilSociety ==
            privateSchoolOrganizationCivilSociety &&
        other.privateSchoolMaintainerCnpj == privateSchoolMaintainerCnpj &&
        other.privateSchoolCnpj == privateSchoolCnpj &&
        other.regulation == regulation &&
        other.regulationOrgan == regulationOrgan &&
        other.regulationOrganFederal == regulationOrganFederal &&
        other.regulationOrganState == regulationOrganState &&
        other.regulationOrganMunicipal == regulationOrganMunicipal &&
        other.offerOrLinkedUnity == offerOrLinkedUnity &&
        other.inepHeadSchool == inepHeadSchool &&
        other.iesCode == iesCode &&
        other.logoFileName == logoFileName &&
        other.logoFileType == logoFileType &&
        other.logoFileContent == logoFileContent &&
        other.actOfAcknowledgement == actOfAcknowledgement;
  }

  @override
  // ignore: long-method
  int get hashCode {
    return registerType.hashCode ^
        inepId.hashCode ^
        managerCpf.hashCode ^
        managerName.hashCode ^
        managerRole.hashCode ^
        managerEmail.hashCode ^
        managerAccessCriterion.hashCode ^
        managerContractType.hashCode ^
        situation.hashCode ^
        initialDate.hashCode ^
        finalDate.hashCode ^
        name.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        cep.hashCode ^
        address.hashCode ^
        addressNumber.hashCode ^
        addressComplement.hashCode ^
        addressNeighborhood.hashCode ^
        edcensoUfFk.hashCode ^
        edcensoCityFk.hashCode ^
        edcensoDistrictFk.hashCode ^
        ddd.hashCode ^
        phoneNumber.hashCode ^
        publicPhoneNumber.hashCode ^
        otherPhoneNumber.hashCode ^
        faxNumber.hashCode ^
        email.hashCode ^
        edcensoRegionalEducationOrganFk.hashCode ^
        administrativeDependence.hashCode ^
        location.hashCode ^
        idDifflocation.hashCode ^
        linkedMec.hashCode ^
        linkedArmy.hashCode ^
        linkedHelth.hashCode ^
        linkedOther.hashCode ^
        privateSchoolCategory.hashCode ^
        publicContract.hashCode ^
        privateSchoolBusinessOrIndividual.hashCode ^
        privateSchoolSyndicateOrAssociation.hashCode ^
        privateSchoolOngOrOscip.hashCode ^
        privateSchoolNonProfitInstitutions.hashCode ^
        privateSchoolSSystem.hashCode ^
        privateSchoolOrganizationCivilSociety.hashCode ^
        privateSchoolMaintainerCnpj.hashCode ^
        privateSchoolCnpj.hashCode ^
        regulation.hashCode ^
        regulationOrgan.hashCode ^
        regulationOrganFederal.hashCode ^
        regulationOrganState.hashCode ^
        regulationOrganMunicipal.hashCode ^
        offerOrLinkedUnity.hashCode ^
        inepHeadSchool.hashCode ^
        iesCode.hashCode ^
        logoFileName.hashCode ^
        logoFileType.hashCode ^
        logoFileContent.hashCode ^
        actOfAcknowledgement.hashCode;
  }

  // ignore: long-method
  factory SchoolEntity.empty() {
    return SchoolEntity(
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
      edcensoUfFk: 1,
      edcensoCityFk: 1,
      edcensoDistrictFk: 1,
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
