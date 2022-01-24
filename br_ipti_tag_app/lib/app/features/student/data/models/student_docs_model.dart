import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';

class StudentDocumentsAddressModel extends StudentDocuments {
  StudentDocumentsAddressModel({
    String? registerType,
    String? schoolInepIdFk,
    String? studentFk,
    int? oldId,
    String? rgNumber,
    String? rgNumberEdcensoOrganIdEmitterFk,
    String? rgNumberEdcensoUfFk,
    String? rgNumberExpedictionDate,
    int? civilCertification,
    int? civilCertificationType,
    String? civilCertificationTermNumber,
    String? civilCertificationSheet,
    String? civilCertificationBook,
    String? civilCertificationDate,
    String? notaryOfficeUfFk,
    String? notaryOfficeCityFk,
    String? edcensoNotaryOfficeFk,
    String? civilRegisterEnrollmentNumber,
    String? cpf,
    String? foreignDocumentOrPassport,
    String? nis,
    int? residenceZone,
    int? diffLocation,
    String? cep,
    String? address,
    String? number,
    String? complement,
    String? neighborhood,
    String? edcensoUfFk,
    String? edcensoCityFk,
    bool? receivedCc,
    String? receivedAddress,
    String? receivedPhoto,
    String? receivedNis,
    String? receivedHistory,
    String? receivedResponsableRg,
    String? receivedResponsableCpf,
    String? cns,
    int? hash,
    String? justiceRestriction,
  }) : super(
          registerType: registerType,
          schoolInepIdFk: schoolInepIdFk,
          studentFk: studentFk,
          oldId: oldId,
          rgNumber: rgNumber,
          rgNumberEdcensoOrganIdEmitterFk: rgNumberEdcensoOrganIdEmitterFk,
          rgNumberEdcensoUfFk: rgNumberEdcensoUfFk,
          rgNumberExpedictionDate: rgNumberExpedictionDate,
          civilCertification: civilCertification,
          civilCertificationType: civilCertificationType,
          civilCertificationTermNumber: civilCertificationTermNumber,
          civilCertificationSheet: civilCertificationSheet,
          civilCertificationBook: civilCertificationBook,
          civilCertificationDate: civilCertificationDate,
          notaryOfficeUfFk: notaryOfficeUfFk,
          notaryOfficeCityFk: notaryOfficeCityFk,
          edcensoNotaryOfficeFk: edcensoNotaryOfficeFk,
          civilRegisterEnrollmentNumber: civilRegisterEnrollmentNumber,
          cpf: cpf,
          foreignDocumentOrPassport: foreignDocumentOrPassport,
          nis: nis,
          residenceZone: residenceZone,
          diffLocation: diffLocation,
          cep: cep,
          address: address,
          number: number,
          complement: complement,
          neighborhood: neighborhood,
          edcensoUfFk: edcensoUfFk,
          edcensoCityFk: edcensoCityFk,
          receivedCc: receivedCc,
          receivedAddress: receivedAddress,
          receivedPhoto: receivedPhoto,
          receivedNis: receivedNis,
          receivedHistory: receivedHistory,
          receivedResponsableRg: receivedResponsableRg,
          receivedResponsableCpf: receivedResponsableCpf,
          cns: cns,
          hash: hash,
          justiceRestriction: justiceRestriction,
        );

  StudentDocumentsAddressModel copyWith({
    String? registerType,
    String? schoolInepIdFk,
    String? studentFk,
    int? oldId,
    String? rgNumber,
    String? rgNumberEdcensoOrganIdEmitterFk,
    String? rgNumberEdcensoUfFk,
    String? rgNumberExpedictionDate,
    int? civilCertification,
    int? civilCertificationType,
    String? civilCertificationTermNumber,
    String? civilCertificationSheet,
    String? civilCertificationBook,
    String? civilCertificationDate,
    String? notaryOfficeUfFk,
    String? notaryOfficeCityFk,
    String? edcensoNotaryOfficeFk,
    String? civilRegisterEnrollmentNumber,
    String? cpf,
    String? foreignDocumentOrPassport,
    String? nis,
    int? residenceZone,
    int? diffLocation,
    String? cep,
    String? address,
    String? number,
    String? complement,
    String? neighborhood,
    String? edcensoUfFk,
    String? edcensoCityFk,
    bool? receivedCc,
    String? receivedAddress,
    String? receivedPhoto,
    String? receivedNis,
    String? receivedHistory,
    String? receivedResponsableRg,
    String? receivedResponsableCpf,
    String? cns,
    int? hash,
    String? justiceRestriction,
  }) {
    return StudentDocumentsAddressModel(
      registerType: registerType ?? this.registerType,
      schoolInepIdFk: schoolInepIdFk ?? this.schoolInepIdFk,
      studentFk: studentFk ?? this.studentFk,
      oldId: oldId ?? this.oldId,
      rgNumber: rgNumber ?? this.rgNumber,
      rgNumberEdcensoOrganIdEmitterFk: rgNumberEdcensoOrganIdEmitterFk ??
          this.rgNumberEdcensoOrganIdEmitterFk,
      rgNumberEdcensoUfFk: rgNumberEdcensoUfFk ?? this.rgNumberEdcensoUfFk,
      rgNumberExpedictionDate:
          rgNumberExpedictionDate ?? this.rgNumberExpedictionDate,
      civilCertification: civilCertification ?? this.civilCertification,
      civilCertificationType:
          civilCertificationType ?? this.civilCertificationType,
      civilCertificationTermNumber:
          civilCertificationTermNumber ?? this.civilCertificationTermNumber,
      civilCertificationSheet:
          civilCertificationSheet ?? this.civilCertificationSheet,
      civilCertificationBook:
          civilCertificationBook ?? this.civilCertificationBook,
      civilCertificationDate:
          civilCertificationDate ?? this.civilCertificationDate,
      notaryOfficeUfFk: notaryOfficeUfFk ?? this.notaryOfficeUfFk,
      notaryOfficeCityFk: notaryOfficeCityFk ?? this.notaryOfficeCityFk,
      edcensoNotaryOfficeFk:
          edcensoNotaryOfficeFk ?? this.edcensoNotaryOfficeFk,
      civilRegisterEnrollmentNumber:
          civilRegisterEnrollmentNumber ?? this.civilRegisterEnrollmentNumber,
      cpf: cpf ?? this.cpf,
      foreignDocumentOrPassport:
          foreignDocumentOrPassport ?? this.foreignDocumentOrPassport,
      nis: nis ?? this.nis,
      residenceZone: residenceZone ?? this.residenceZone,
      diffLocation: diffLocation ?? this.diffLocation,
      cep: cep ?? this.cep,
      address: address ?? this.address,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      neighborhood: neighborhood ?? this.neighborhood,
      edcensoUfFk: edcensoUfFk ?? this.edcensoUfFk,
      edcensoCityFk: edcensoCityFk ?? this.edcensoCityFk,
      receivedCc: receivedCc ?? this.receivedCc,
      receivedAddress: receivedAddress ?? this.receivedAddress,
      receivedPhoto: receivedPhoto ?? this.receivedPhoto,
      receivedNis: receivedNis ?? this.receivedNis,
      receivedHistory: receivedHistory ?? this.receivedHistory,
      receivedResponsableRg:
          receivedResponsableRg ?? this.receivedResponsableRg,
      receivedResponsableCpf:
          receivedResponsableCpf ?? this.receivedResponsableCpf,
      cns: cns ?? this.cns,
      hash: hash ?? this.hash,
      justiceRestriction: justiceRestriction ?? this.justiceRestriction,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'registerType': registerType,
      'schoolInepIdFk': schoolInepIdFk,
      'studentFk': studentFk,
      'oldId': oldId,
      'rgNumber': rgNumber,
      'rgNumberEdcensoOrganIdEmitterFk': rgNumberEdcensoOrganIdEmitterFk,
      'rgNumberEdcensoUfFk': rgNumberEdcensoUfFk,
      'rgNumberExpedictionDate': rgNumberExpedictionDate,
      'civilCertification': civilCertification,
      'civilCertificationType': civilCertificationType,
      'civilCertificationTermNumber': civilCertificationTermNumber,
      'civilCertificationSheet': civilCertificationSheet,
      'civilCertificationBook': civilCertificationBook,
      'civilCertificationDate': civilCertificationDate,
      'notaryOfficeUfFk': notaryOfficeUfFk,
      'notaryOfficeCityFk': notaryOfficeCityFk,
      'edcensoNotaryOfficeFk': edcensoNotaryOfficeFk,
      'civilRegisterEnrollmentNumber': civilRegisterEnrollmentNumber,
      'cpf': cpf,
      'foreignDocumentOrPassport': foreignDocumentOrPassport,
      'nis': nis,
      'residenceZone': residenceZone,
      'diffLocation': diffLocation,
      'cep': cep,
      'address': address,
      'number': number,
      'complement': complement,
      'neighborhood': neighborhood,
      'edcensoUfFk': edcensoUfFk,
      'edcensoCityFk': edcensoCityFk,
      'receivedCc': receivedCc,
      'receivedAddress': receivedAddress,
      'receivedPhoto': receivedPhoto,
      'receivedNis': receivedNis,
      'receivedHistory': receivedHistory,
      'receivedResponsableRg': receivedResponsableRg,
      'receivedResponsableCpf': receivedResponsableCpf,
      'cns': cns,
      'hash': hash,
      'justiceRestriction': justiceRestriction,
    };
  }

  factory StudentDocumentsAddressModel.fromMap(Map<String, dynamic> map) {
    return StudentDocumentsAddressModel(
      registerType: map['registerType'],
      schoolInepIdFk: map['schoolInepIdFk'],
      studentFk: map['studentFk'],
      oldId: map['oldId']?.toInt(),
      rgNumber: map['rgNumber'],
      rgNumberEdcensoOrganIdEmitterFk: map['rgNumberEdcensoOrganIdEmitterFk'],
      rgNumberEdcensoUfFk: map['rgNumberEdcensoUfFk'],
      rgNumberExpedictionDate: map['rgNumberExpedictionDate'],
      civilCertification: map['civilCertification']?.toInt(),
      civilCertificationType: map['civilCertificationType']?.toInt(),
      civilCertificationTermNumber: map['civilCertificationTermNumber'],
      civilCertificationSheet: map['civilCertificationSheet'],
      civilCertificationBook: map['civilCertificationBook'],
      civilCertificationDate: map['civilCertificationDate'],
      notaryOfficeUfFk: map['notaryOfficeUfFk'],
      notaryOfficeCityFk: map['notaryOfficeCityFk'],
      edcensoNotaryOfficeFk: map['edcensoNotaryOfficeFk'],
      civilRegisterEnrollmentNumber: map['civilRegisterEnrollmentNumber'],
      cpf: map['cpf'],
      foreignDocumentOrPassport: map['foreignDocumentOrPassport'],
      nis: map['nis'],
      residenceZone: map['residenceZone']?.toInt(),
      diffLocation: map['diffLocation']?.toInt(),
      cep: map['cep'],
      address: map['address'],
      number: map['number'],
      complement: map['complement'],
      neighborhood: map['neighborhood'],
      edcensoUfFk: map['edcensoUfFk'],
      edcensoCityFk: map['edcensoCityFk'],
      receivedCc: map['receivedCc'],
      receivedAddress: map['receivedAddress'],
      receivedPhoto: map['receivedPhoto'],
      receivedNis: map['receivedNis'],
      receivedHistory: map['receivedHistory'],
      receivedResponsableRg: map['receivedResponsableRg'],
      receivedResponsableCpf: map['receivedResponsableCpf'],
      cns: map['cns'],
      hash: map['hash']?.toInt(),
      justiceRestriction: map['justiceRestriction'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentDocumentsAddressModel.fromJson(String source) =>
      StudentDocumentsAddressModel.fromMap(json.decode(source));

  factory StudentDocumentsAddressModel.fromEntity(
      StudentDocuments studentDocuments) {
    return studentDocuments as StudentDocumentsAddressModel;
  }

  @override
  String toString() {
    return '''StudentDocumentsAddressModel(registerType: $registerType, schoolInepIdFk: $schoolInepIdFk, studentFk: $studentFk, oldId: $oldId, rgNumber: $rgNumber, rgNumberEdcensoOrganIdEmitterFk: $rgNumberEdcensoOrganIdEmitterFk, rgNumberEdcensoUfFk: $rgNumberEdcensoUfFk, rgNumberExpedictionDate: $rgNumberExpedictionDate, civilCertification: $civilCertification, civilCertificationType: $civilCertificationType, civilCertificationTermNumber: $civilCertificationTermNumber, civilCertificationSheet: $civilCertificationSheet, civilCertificationBook: $civilCertificationBook, civilCertificationDate: $civilCertificationDate, notaryOfficeUfFk: $notaryOfficeUfFk, notaryOfficeCityFk: $notaryOfficeCityFk, edcensoNotaryOfficeFk: $edcensoNotaryOfficeFk, civilRegisterEnrollmentNumber: $civilRegisterEnrollmentNumber, cpf: $cpf, foreignDocumentOrPassport: $foreignDocumentOrPassport, nis: $nis, residenceZone: $residenceZone, diffLocation: $diffLocation, cep: $cep, address: $address, number: $number, complement: $complement, neighborhood: $neighborhood, edcensoUfFk: $edcensoUfFk, edcensoCityFk: $edcensoCityFk, receivedCc: $receivedCc, receivedAddress: $receivedAddress, receivedPhoto: $receivedPhoto, receivedNis: $receivedNis, receivedHistory: $receivedHistory, receivedResponsableRg: $receivedResponsableRg, receivedResponsableCpf: $receivedResponsableCpf, cns: $cns, hash: $hash, justiceRestriction: $justiceRestriction)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentDocumentsAddressModel &&
        other.registerType == registerType &&
        other.schoolInepIdFk == schoolInepIdFk &&
        other.studentFk == studentFk &&
        other.oldId == oldId &&
        other.rgNumber == rgNumber &&
        other.rgNumberEdcensoOrganIdEmitterFk ==
            rgNumberEdcensoOrganIdEmitterFk &&
        other.rgNumberEdcensoUfFk == rgNumberEdcensoUfFk &&
        other.rgNumberExpedictionDate == rgNumberExpedictionDate &&
        other.civilCertification == civilCertification &&
        other.civilCertificationType == civilCertificationType &&
        other.civilCertificationTermNumber == civilCertificationTermNumber &&
        other.civilCertificationSheet == civilCertificationSheet &&
        other.civilCertificationBook == civilCertificationBook &&
        other.civilCertificationDate == civilCertificationDate &&
        other.notaryOfficeUfFk == notaryOfficeUfFk &&
        other.notaryOfficeCityFk == notaryOfficeCityFk &&
        other.edcensoNotaryOfficeFk == edcensoNotaryOfficeFk &&
        other.civilRegisterEnrollmentNumber == civilRegisterEnrollmentNumber &&
        other.cpf == cpf &&
        other.foreignDocumentOrPassport == foreignDocumentOrPassport &&
        other.nis == nis &&
        other.residenceZone == residenceZone &&
        other.diffLocation == diffLocation &&
        other.cep == cep &&
        other.address == address &&
        other.number == number &&
        other.complement == complement &&
        other.neighborhood == neighborhood &&
        other.edcensoUfFk == edcensoUfFk &&
        other.edcensoCityFk == edcensoCityFk &&
        other.receivedCc == receivedCc &&
        other.receivedAddress == receivedAddress &&
        other.receivedPhoto == receivedPhoto &&
        other.receivedNis == receivedNis &&
        other.receivedHistory == receivedHistory &&
        other.receivedResponsableRg == receivedResponsableRg &&
        other.receivedResponsableCpf == receivedResponsableCpf &&
        other.cns == cns &&
        other.hash == hash &&
        other.justiceRestriction == justiceRestriction;
  }

  @override
  int get hashCode {
    return registerType.hashCode ^
        schoolInepIdFk.hashCode ^
        studentFk.hashCode ^
        oldId.hashCode ^
        rgNumber.hashCode ^
        rgNumberEdcensoOrganIdEmitterFk.hashCode ^
        rgNumberEdcensoUfFk.hashCode ^
        rgNumberExpedictionDate.hashCode ^
        civilCertification.hashCode ^
        civilCertificationType.hashCode ^
        civilCertificationTermNumber.hashCode ^
        civilCertificationSheet.hashCode ^
        civilCertificationBook.hashCode ^
        civilCertificationDate.hashCode ^
        notaryOfficeUfFk.hashCode ^
        notaryOfficeCityFk.hashCode ^
        edcensoNotaryOfficeFk.hashCode ^
        civilRegisterEnrollmentNumber.hashCode ^
        cpf.hashCode ^
        foreignDocumentOrPassport.hashCode ^
        nis.hashCode ^
        residenceZone.hashCode ^
        diffLocation.hashCode ^
        cep.hashCode ^
        address.hashCode ^
        number.hashCode ^
        complement.hashCode ^
        neighborhood.hashCode ^
        edcensoUfFk.hashCode ^
        edcensoCityFk.hashCode ^
        receivedCc.hashCode ^
        receivedAddress.hashCode ^
        receivedPhoto.hashCode ^
        receivedNis.hashCode ^
        receivedHistory.hashCode ^
        receivedResponsableRg.hashCode ^
        receivedResponsableCpf.hashCode ^
        cns.hashCode ^
        hash.hashCode ^
        justiceRestriction.hashCode;
  }
}
