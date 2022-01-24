import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_address.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_doc_address_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:dartz/dartz.dart';

class AddDocumentsAndAddressToStudentUsecase
    implements
        Usecase<StudentDocuments, AddDocumentsAndAddressToStudentParams> {
  AddDocumentsAndAddressToStudentUsecase(this._documentsAddressRepository);

  final StudentDocumentsAddressRepository _documentsAddressRepository;

  @override
  Future<Either<Exception, StudentDocuments>> call(
      AddDocumentsAndAddressToStudentParams params) async {
    final studentDocumentsAddress = StudentDocuments(
      registerType: params.registerType,
      schoolInepIdFk: params.schoolInepIdFk,
      studentFk: params.studentFk,
      oldId: params.oldId,
      rgNumber: params.rgNumber,
      rgNumberEdcensoOrganIdEmitterFk: params.rgNumberEdcensoOrganIdEmitterFk,
      rgNumberEdcensoUfFk: params.rgNumberEdcensoUfFk,
      rgNumberExpedictionDate: params.rgNumberExpedictionDate,
      civilCertification: params.civilCertification,
      civilCertificationType: params.civilCertificationType,
      civilCertificationTermNumber: params.civilCertificationTermNumber,
      civilCertificationSheet: params.civilCertificationSheet,
      civilCertificationBook: params.civilCertificationBook,
      civilCertificationDate: params.civilCertificationDate,
      notaryOfficeUfFk: params.notaryOfficeUfFk,
      notaryOfficeCityFk: params.notaryOfficeCityFk,
      edcensoNotaryOfficeFk: params.edcensoNotaryOfficeFk,
      civilRegisterEnrollmentNumber: params.civilRegisterEnrollmentNumber,
      cpf: params.cpf,
      foreignDocumentOrPassport: params.foreignDocumentOrPassport,
      nis: params.nis,
      residenceZone: params.residenceZone,
      diffLocation: params.diffLocation,
      cep: params.cep,
      address: params.address,
      number: params.number,
      complement: params.complement,
      neighborhood: params.neighborhood,
      edcensoUfFk: params.edcensoUfFk,
      edcensoCityFk: params.edcensoCityFk,
      receivedCc: params.receivedCc,
      receivedAddress: params.receivedAddress,
      receivedPhoto: params.receivedPhoto,
      receivedNis: params.receivedNis,
      receivedHistory: params.receivedHistory,
      receivedResponsableRg: params.receivedResponsableRg,
      receivedResponsableCpf: params.receivedResponsableCpf,
      cns: params.cns,
      hash: params.hash,
      justiceRestriction: params.justiceRestriction,
    );

    final result = await _documentsAddressRepository.create(
      studentDocumentsAddress,
    );

    return result;
  }
}

class AddDocumentsAndAddressToStudentParams {
  String? registerType;
  String? schoolInepIdFk;
  String? studentFk;
  int? oldId;
  String? rgNumber;
  String? rgNumberEdcensoOrganIdEmitterFk;
  String? rgNumberEdcensoUfFk;
  String? rgNumberExpedictionDate;
  int? civilCertification;
  int? civilCertificationType;
  String? civilCertificationTermNumber;
  String? civilCertificationSheet;
  String? civilCertificationBook;
  String? civilCertificationDate;
  String? notaryOfficeUfFk;
  String? notaryOfficeCityFk;
  String? edcensoNotaryOfficeFk;
  String? civilRegisterEnrollmentNumber;
  String? cpf;
  String? foreignDocumentOrPassport;
  String? nis;
  bool? receivedCc;
  String? receivedAddress;
  String? receivedPhoto;
  String? receivedNis;
  String? receivedHistory;
  String? receivedResponsableRg;
  String? receivedResponsableCpf;
  String? cns;
  int? hash;
  String? justiceRestriction;
  int? residenceZone;
  int? diffLocation;
  String? cep;
  String? address;
  String? number;
  String? complement;
  String? neighborhood;
  String? edcensoUfFk;
  String? edcensoCityFk;
  AddDocumentsAndAddressToStudentParams({
    this.registerType,
    this.schoolInepIdFk,
    this.studentFk,
    this.oldId,
    this.rgNumber,
    this.rgNumberEdcensoOrganIdEmitterFk,
    this.rgNumberEdcensoUfFk,
    this.rgNumberExpedictionDate,
    this.civilCertification,
    this.civilCertificationType,
    this.civilCertificationTermNumber,
    this.civilCertificationSheet,
    this.civilCertificationBook,
    this.civilCertificationDate,
    this.notaryOfficeUfFk,
    this.notaryOfficeCityFk,
    this.edcensoNotaryOfficeFk,
    this.civilRegisterEnrollmentNumber,
    this.cpf,
    this.foreignDocumentOrPassport,
    this.nis,
    this.receivedCc,
    this.receivedAddress,
    this.receivedPhoto,
    this.receivedNis,
    this.receivedHistory,
    this.receivedResponsableRg,
    this.receivedResponsableCpf,
    this.cns,
    this.hash,
    this.justiceRestriction,
    this.residenceZone,
    this.diffLocation,
    this.cep,
    this.address,
    this.number,
    this.complement,
    this.neighborhood,
    this.edcensoUfFk,
    this.edcensoCityFk,
  });
}
