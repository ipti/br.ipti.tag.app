import 'dart:convert';

import 'package:br_ipti_tag_app/app/core/model/model.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';

class SchoolModel extends SchoolEntity implements Model {
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
  // EdcensoUfFk? edcensoUfFk;
  // EdcensoUfFk? edcensoCityFk;
  // EdcensoUfFk? edcensoDistrictFk;
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

  SchoolModel(
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
      this.createdAt,
      this.updatedAt);

  SchoolModel copyWith({
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
    String? createdAt,
    String? updatedAt,
  }) {
    return SchoolModel(
      registerType ?? this.registerType,
      inepId ?? this.inepId,
      managerCpf ?? this.managerCpf,
      managerName ?? this.managerName,
      managerRole ?? this.managerRole,
      managerEmail ?? this.managerEmail,
      managerAccessCriterion ?? this.managerAccessCriterion,
      managerContractType ?? this.managerContractType,
      situation ?? this.situation,
      initialDate ?? this.initialDate,
      finalDate ?? this.finalDate,
      name ?? this.name,
      latitude ?? this.latitude,
      longitude ?? this.longitude,
      cep ?? this.cep,
      address ?? this.address,
      addressNumber ?? this.addressNumber,
      addressComplement ?? this.addressComplement,
      addressNeighborhood ?? this.addressNeighborhood,
      ddd ?? this.ddd,
      phoneNumber ?? this.phoneNumber,
      publicPhoneNumber ?? this.publicPhoneNumber,
      otherPhoneNumber ?? this.otherPhoneNumber,
      faxNumber ?? this.faxNumber,
      email ?? this.email,
      edcensoRegionalEducationOrganFk ?? this.edcensoRegionalEducationOrganFk,
      administrativeDependence ?? this.administrativeDependence,
      location ?? this.location,
      idDifflocation ?? this.idDifflocation,
      linkedMec ?? this.linkedMec,
      linkedArmy ?? this.linkedArmy,
      linkedHelth ?? this.linkedHelth,
      linkedOther ?? this.linkedOther,
      privateSchoolCategory ?? this.privateSchoolCategory,
      publicContract ?? this.publicContract,
      privateSchoolBusinessOrIndividual ??
          this.privateSchoolBusinessOrIndividual,
      privateSchoolSyndicateOrAssociation ??
          this.privateSchoolSyndicateOrAssociation,
      privateSchoolOngOrOscip ?? this.privateSchoolOngOrOscip,
      privateSchoolNonProfitInstitutions ??
          this.privateSchoolNonProfitInstitutions,
      privateSchoolSSystem ?? this.privateSchoolSSystem,
      privateSchoolOrganizationCivilSociety ??
          this.privateSchoolOrganizationCivilSociety,
      privateSchoolMaintainerCnpj ?? this.privateSchoolMaintainerCnpj,
      privateSchoolCnpj ?? this.privateSchoolCnpj,
      regulation ?? this.regulation,
      regulationOrgan ?? this.regulationOrgan,
      regulationOrganFederal ?? this.regulationOrganFederal,
      regulationOrganState ?? this.regulationOrganState,
      regulationOrganMunicipal ?? this.regulationOrganMunicipal,
      offerOrLinkedUnity ?? this.offerOrLinkedUnity,
      inepHeadSchool ?? this.inepHeadSchool,
      iesCode ?? this.iesCode,
      logoFileName ?? this.logoFileName,
      logoFileType ?? this.logoFileType,
      logoFileContent ?? this.logoFileContent,
      actOfAcknowledgement ?? this.actOfAcknowledgement,
      createdAt ?? this.createdAt,
      updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'registerType': registerType,
      'inepId': inepId,
      'managerCpf': managerCpf,
      'managerName': managerName,
      'managerRole': managerRole,
      'managerEmail': managerEmail,
      'managerAccessCriterion': managerAccessCriterion,
      'managerContractType': managerContractType,
      'situation': situation,
      'initialDate': initialDate,
      'finalDate': finalDate,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'cep': cep,
      'address': address,
      'addressNumber': addressNumber,
      'addressComplement': addressComplement,
      'addressNeighborhood': addressNeighborhood,
      'ddd': ddd,
      'phoneNumber': phoneNumber,
      'publicPhoneNumber': publicPhoneNumber,
      'otherPhoneNumber': otherPhoneNumber,
      'faxNumber': faxNumber,
      'email': email,
      'edcensoRegionalEducationOrganFk': edcensoRegionalEducationOrganFk,
      'administrativeDependence': administrativeDependence,
      'location': location,
      'idDifflocation': idDifflocation,
      'linkedMec': linkedMec,
      'linkedArmy': linkedArmy,
      'linkedHelth': linkedHelth,
      'linkedOther': linkedOther,
      'privateSchoolCategory': privateSchoolCategory,
      'publicContract': publicContract,
      'privateSchoolBusinessOrIndividual': privateSchoolBusinessOrIndividual,
      'privateSchoolSyndicateOrAssociation':
          privateSchoolSyndicateOrAssociation,
      'privateSchoolOngOrOscip': privateSchoolOngOrOscip,
      'privateSchoolNonProfitInstitutions': privateSchoolNonProfitInstitutions,
      'privateSchoolSSystem': privateSchoolSSystem,
      'privateSchoolOrganizationCivilSociety':
          privateSchoolOrganizationCivilSociety,
      'privateSchoolMaintainerCnpj': privateSchoolMaintainerCnpj,
      'privateSchoolCnpj': privateSchoolCnpj,
      'regulation': regulation,
      'regulationOrgan': regulationOrgan,
      'regulationOrganFederal': regulationOrganFederal,
      'regulationOrganState': regulationOrganState,
      'regulationOrganMunicipal': regulationOrganMunicipal,
      'offerOrLinkedUnity': offerOrLinkedUnity,
      'inepHeadSchool': inepHeadSchool,
      'iesCode': iesCode,
      'logoFileName': logoFileName,
      'logoFileType': logoFileType,
      'logoFileContent': logoFileContent,
      'actOfAcknowledgement': actOfAcknowledgement,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory SchoolModel.fromMap(Map<String, dynamic> map) {
    return SchoolModel(
      map['registerType'] ?? '',
      map['inepId'] ?? '',
      map['managerCpf'] ?? '',
      map['managerName'] ?? '',
      map['managerRole']?.toInt() ?? 0,
      map['managerEmail'] ?? '',
      map['managerAccessCriterion'] ?? '',
      map['managerContractType']?.toInt() ?? 0,
      map['situation']?.toInt() ?? 0,
      map['initialDate'] ?? '',
      map['finalDate'] ?? '',
      map['name'] ?? '',
      map['latitude'] ?? '',
      map['longitude'] ?? '',
      map['cep'] ?? '',
      map['address'] ?? '',
      map['addressNumber'] ?? '',
      map['addressComplement'] ?? '',
      map['addressNeighborhood'] ?? '',
      map['ddd'] ?? '',
      map['phoneNumber'] ?? '',
      map['publicPhoneNumber'] ?? '',
      map['otherPhoneNumber'] ?? '',
      map['faxNumber'] ?? '',
      map['email'] ?? '',
      map['edcensoRegionalEducationOrganFk'] ?? '',
      map['administrativeDependence']?.toInt() ?? 0,
      map['location']?.toInt() ?? 0,
      map['idDifflocation']?.toInt() ?? 0,
      map['linkedMec'] ?? false,
      map['linkedArmy'] ?? false,
      map['linkedHelth'] ?? false,
      map['linkedOther'] ?? false,
      map['privateSchoolCategory']?.toInt() ?? 0,
      map['publicContract']?.toInt() ?? 0,
      map['privateSchoolBusinessOrIndividual'] ?? false,
      map['privateSchoolSyndicateOrAssociation'] ?? false,
      map['privateSchoolOngOrOscip'] ?? false,
      map['privateSchoolNonProfitInstitutions'] ?? false,
      map['privateSchoolSSystem'] ?? false,
      map['privateSchoolOrganizationCivilSociety'] ?? false,
      map['privateSchoolMaintainerCnpj'] ?? '',
      map['privateSchoolCnpj'] ?? '',
      map['regulation']?.toInt() ?? 0,
      map['regulationOrgan']?.toInt() ?? 0,
      map['regulationOrganFederal'] ?? false,
      map['regulationOrganState'] ?? false,
      map['regulationOrganMunicipal'] ?? false,
      map['offerOrLinkedUnity']?.toInt() ?? 0,
      map['inepHeadSchool'] ?? '',
      map['iesCode'] ?? '',
      map['logoFileName'] ?? '',
      map['logoFileType'] ?? '',
      map['logoFileContent'] ?? '',
      map['actOfAcknowledgement'] ?? '',
      map['createdAt'] ?? '',
      map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolModel.fromJson(String source) =>
      SchoolModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SchoolModel(registerType: $registerType, inepId: $inepId, managerCpf: $managerCpf, managerName: $managerName, managerRole: $managerRole, managerEmail: $managerEmail, managerAccessCriterion: $managerAccessCriterion, managerContractType: $managerContractType, situation: $situation, initialDate: $initialDate, finalDate: $finalDate, name: $name, latitude: $latitude, longitude: $longitude, cep: $cep, address: $address, addressNumber: $addressNumber, addressComplement: $addressComplement, addressNeighborhood: $addressNeighborhood, ddd: $ddd, phoneNumber: $phoneNumber, publicPhoneNumber: $publicPhoneNumber, otherPhoneNumber: $otherPhoneNumber, faxNumber: $faxNumber, email: $email, edcensoRegionalEducationOrganFk: $edcensoRegionalEducationOrganFk, administrativeDependence: $administrativeDependence, location: $location, idDifflocation: $idDifflocation, linkedMec: $linkedMec, linkedArmy: $linkedArmy, linkedHelth: $linkedHelth, linkedOther: $linkedOther, privateSchoolCategory: $privateSchoolCategory, publicContract: $publicContract, privateSchoolBusinessOrIndividual: $privateSchoolBusinessOrIndividual, privateSchoolSyndicateOrAssociation: $privateSchoolSyndicateOrAssociation, privateSchoolOngOrOscip: $privateSchoolOngOrOscip, privateSchoolNonProfitInstitutions: $privateSchoolNonProfitInstitutions, privateSchoolSSystem: $privateSchoolSSystem, privateSchoolOrganizationCivilSociety: $privateSchoolOrganizationCivilSociety, privateSchoolMaintainerCnpj: $privateSchoolMaintainerCnpj, privateSchoolCnpj: $privateSchoolCnpj, regulation: $regulation, regulationOrgan: $regulationOrgan, regulationOrganFederal: $regulationOrganFederal, regulationOrganState: $regulationOrganState, regulationOrganMunicipal: $regulationOrganMunicipal, offerOrLinkedUnity: $offerOrLinkedUnity, inepHeadSchool: $inepHeadSchool, iesCode: $iesCode, logoFileName: $logoFileName, logoFileType: $logoFileType, logoFileContent: $logoFileContent, actOfAcknowledgement: $actOfAcknowledgement, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SchoolModel &&
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
        other.actOfAcknowledgement == actOfAcknowledgement &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
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
        actOfAcknowledgement.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
