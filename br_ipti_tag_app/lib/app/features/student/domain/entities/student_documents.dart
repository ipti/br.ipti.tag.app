class StudentDocuments {
  String? registerType;
  String schoolInepIdFk;
  String studentFk;
  int? oldId;
  String rgNumber;
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
  int residenceZone;
  int? diffLocation;
  String? cep;
  String? address;
  String? number;
  String? complement;
  String? neighborhood;
  String edcensoUfFk;
  String edcensoCityFk;

  StudentDocuments({
    this.registerType,
    required this.schoolInepIdFk,
    required this.studentFk,
    this.oldId,
    required this.rgNumber,
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
    this.residenceZone = 0,
    this.diffLocation,
    this.cep,
    this.address,
    this.number,
    this.complement,
    this.neighborhood,
    required this.edcensoUfFk,
    required this.edcensoCityFk,
  });
}
