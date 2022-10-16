import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';

class StudentDocumentsAddressModel extends StudentDocsAddress {
  StudentDocumentsAddressModel({
    super.id,
    super.registerType,
    required super.schoolInepIdFk,
    required super.studentFk,
    super.oldId,
    required super.rgNumber,
    super.rgNumberEdcensoOrganIdEmitterFk,
    super.rgNumberEdcensoUfFk,
    super.rgNumberExpedictionDate,
    super.civilCertification,
    super.civilCertificationType,
    super.civilCertificationTermNumber,
    super.civilCertificationSheet,
    super.civilCertificationBook,
    super.civilCertificationDate,
    super.notaryOfficeUfFk,
    super.notaryOfficeCityFk,
    super.edcensoNotaryOfficeFk,
    super.civilRegisterEnrollmentNumber,
    super.cpf,
    super.foreignDocumentOrPassport,
    super.nis,
    super.residenceZone = 0,
    super.diffLocation,
    super.cep,
    super.address,
    super.number,
    super.complement,
    super.neighborhood,
    required super.edcensoUfFk,
    required super.edcensoCityFk,
    super.receivedCc,
    super.receivedAddress,
    super.receivedPhoto,
    super.receivedNis,
    super.receivedHistory,
    super.receivedResponsableRg,
    super.receivedResponsableCpf,
    super.cns,
    super.hash,
    super.justiceRestriction,
  });

  @override
  StudentDocumentsAddressModel copyWith({
    String? id,
    String? registerType,
    String? schoolInepIdFk,
    int? studentFk,
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
      id: id ?? this.id,
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

  factory StudentDocumentsAddressModel.fromEntity(
    StudentDocsAddress studentDocuments,
  ) {
    return StudentDocumentsAddressModel(
      id: studentDocuments.id,
      registerType: studentDocuments.registerType,
      schoolInepIdFk: studentDocuments.schoolInepIdFk,
      studentFk: studentDocuments.studentFk,
      oldId: studentDocuments.oldId,
      rgNumber: studentDocuments.rgNumber,
      rgNumberEdcensoOrganIdEmitterFk:
          studentDocuments.rgNumberEdcensoOrganIdEmitterFk,
      rgNumberEdcensoUfFk: studentDocuments.rgNumberEdcensoUfFk,
      rgNumberExpedictionDate: studentDocuments.rgNumberExpedictionDate,
      civilCertification: studentDocuments.civilCertification,
      civilCertificationType: studentDocuments.civilCertificationType,
      civilCertificationTermNumber:
          studentDocuments.civilCertificationTermNumber,
      civilCertificationSheet: studentDocuments.civilCertificationSheet,
      civilCertificationBook: studentDocuments.civilCertificationBook,
      civilCertificationDate: studentDocuments.civilCertificationDate,
      notaryOfficeUfFk: studentDocuments.notaryOfficeUfFk,
      notaryOfficeCityFk: studentDocuments.notaryOfficeCityFk,
      edcensoNotaryOfficeFk: studentDocuments.edcensoNotaryOfficeFk,
      civilRegisterEnrollmentNumber:
          studentDocuments.civilRegisterEnrollmentNumber,
      cpf: studentDocuments.cpf,
      foreignDocumentOrPassport: studentDocuments.foreignDocumentOrPassport,
      nis: studentDocuments.nis,
      residenceZone: studentDocuments.residenceZone,
      diffLocation: studentDocuments.diffLocation,
      cep: studentDocuments.cep,
      address: studentDocuments.address,
      number: studentDocuments.number,
      complement: studentDocuments.complement,
      neighborhood: studentDocuments.neighborhood,
      edcensoUfFk: studentDocuments.edcensoUfFk,
      edcensoCityFk: studentDocuments.edcensoCityFk,
      receivedCc: studentDocuments.receivedCc,
      receivedAddress: studentDocuments.receivedAddress,
      receivedPhoto: studentDocuments.receivedPhoto,
      receivedNis: studentDocuments.receivedNis,
      receivedHistory: studentDocuments.receivedHistory,
      receivedResponsableRg: studentDocuments.receivedResponsableRg,
      receivedResponsableCpf: studentDocuments.receivedResponsableCpf,
      cns: studentDocuments.cns,
      hash: studentDocuments.hash,
      justiceRestriction: studentDocuments.justiceRestriction,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'register_type': registerType,
      'school_inep_id_fk': schoolInepIdFk,
      'student_fk': studentFk,
      'old_id': oldId,
      'rg_number': rgNumber,
      'rg_number_edcenso_organ_id_emitter_fk': rgNumberEdcensoOrganIdEmitterFk,
      'rg_number_edcenso_uf_fk': rgNumberEdcensoUfFk,
      'rg_number_expediction_date': rgNumberExpedictionDate,
      'civil_certification': civilCertification,
      'civil_certification_type': civilCertificationType,
      'civil_certification_term_number': civilCertificationTermNumber,
      'civil_certification_sheet': civilCertificationSheet,
      'civil_certification_book': civilCertificationBook,
      'civil_certification_date': civilCertificationDate,
      'notary_office_uf_fk': notaryOfficeUfFk,
      'notary_office_city_fk': notaryOfficeCityFk,
      'edcenso_notary_office_fk': edcensoNotaryOfficeFk,
      'civil_register_enrollment_number': civilRegisterEnrollmentNumber,
      'cpf': cpf,
      'foreign_document_or_passport': foreignDocumentOrPassport,
      'nis': nis,
      'received_cc': receivedCc,
      'received_address': receivedAddress,
      'received_photo': receivedPhoto,
      'received_nis': receivedNis,
      'received_history': receivedHistory,
      'received_responsable_rg': receivedResponsableRg,
      'received_responsable_cpf': receivedResponsableCpf,
      'cns': cns,
      'hash': hash,
      'justice_restriction': justiceRestriction,
      'residence_zone': residenceZone,
      'diff_location': diffLocation,
      'cep': cep,
      'address': address,
      'number': number,
      'complement': complement,
      'neighborhood': neighborhood,
      'edcenso_uf_fk': edcensoUfFk,
      'edcenso_city_fk': edcensoCityFk,
    };
  }

  factory StudentDocumentsAddressModel.fromMap(Map<String, dynamic> map) {
    return StudentDocumentsAddressModel(
      id: map['_id'],
      registerType: map['register_type'],
      schoolInepIdFk: map['school_inep_id_fk'] ?? '',
      studentFk: map['student_fk'] ?? '',
      oldId: map['old_id'],
      rgNumber: map['rg_number'] ?? '',
      rgNumberEdcensoOrganIdEmitterFk:
          map['rg_number_edcenso_organ_id_emitter_fk'],
      rgNumberEdcensoUfFk: map['rg_number_edcenso_uf_fk'],
      rgNumberExpedictionDate: map['rg_number_expediction_date'],
      civilCertification: map['civil_certification'],
      civilCertificationType: map['civil_certification_type'],
      civilCertificationTermNumber: map['civil_certification_term_number'],
      civilCertificationSheet: map['civil_certification_sheet'],
      civilCertificationBook: map['civil_certification_book'],
      civilCertificationDate: map['civil_certification_date'],
      notaryOfficeUfFk: map['notary_office_uf_fk'],
      notaryOfficeCityFk: map['notary_office_city_fk'],
      edcensoNotaryOfficeFk: map['edcenso_notary_office_fk'],
      civilRegisterEnrollmentNumber: map['civil_register_enrollment_number'],
      cpf: map['cpf'],
      foreignDocumentOrPassport: map['foreign_document_or_passport'],
      nis: map['nis'],
      receivedCc: map['received_cc'],
      receivedAddress: map['received_address'],
      receivedPhoto: map['received_photo'],
      receivedNis: map['received_nis'],
      receivedHistory: map['received_history'],
      receivedResponsableRg: map['received_responsable_rg'],
      receivedResponsableCpf: map['received_responsable_cpf'],
      cns: map['cns'],
      hash: map['hash'],
      justiceRestriction: map['justice_restriction'],
      residenceZone: map['residence_zone'],
      diffLocation: map['diff_location'],
      cep: map['cep'],
      address: map['address'],
      number: map['number'],
      complement: map['complement'],
      neighborhood: map['neighborhood'],
      edcensoUfFk: map['edcenso_uf_fk'] ?? '',
      edcensoCityFk: map['edcenso_city_fk'] ?? '',
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory StudentDocumentsAddressModel.fromJson(String source) =>
      StudentDocumentsAddressModel.fromMap(
        json.decode(source),
      );

  @override
  String toString() {
    return '''StudentDocumentsAddressModel(id: $id, registerType: $registerType, schoolInepIdFk: $schoolInepIdFk, studentFk: $studentFk, oldId: $oldId, rgNumber: $rgNumber, rgNumberEdcensoOrganIdEmitterFk: $rgNumberEdcensoOrganIdEmitterFk, rgNumberEdcensoUfFk: $rgNumberEdcensoUfFk, rgNumberExpedictionDate: $rgNumberExpedictionDate, civilCertification: $civilCertification, civilCertificationType: $civilCertificationType, civilCertificationTermNumber: $civilCertificationTermNumber, civilCertificationSheet: $civilCertificationSheet, civilCertificationBook: $civilCertificationBook, civilCertificationDate: $civilCertificationDate, notaryOfficeUfFk: $notaryOfficeUfFk, notaryOfficeCityFk: $notaryOfficeCityFk, edcensoNotaryOfficeFk: $edcensoNotaryOfficeFk, civilRegisterEnrollmentNumber: $civilRegisterEnrollmentNumber, cpf: $cpf, foreignDocumentOrPassport: $foreignDocumentOrPassport, nis: $nis, residenceZone: $residenceZone, diffLocation: $diffLocation, cep: $cep, address: $address, number: $number, complement: $complement, neighborhood: $neighborhood, edcensoUfFk: $edcensoUfFk, edcensoCityFk: $edcensoCityFk, receivedCc: $receivedCc, receivedAddress: $receivedAddress, receivedPhoto: $receivedPhoto, receivedNis: $receivedNis, receivedHistory: $receivedHistory, receivedResponsableRg: $receivedResponsableRg, receivedResponsableCpf: $receivedResponsableCpf, cns: $cns, hash: $hash, justiceRestriction: $justiceRestriction)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentDocumentsAddressModel &&
        other.id == id &&
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
    return id.hashCode ^
        registerType.hashCode ^
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
