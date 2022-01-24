class StudentEnrollment {
  String? registerType;
  String schoolInepIdFk;
  String studentFk;
  int oldId;
  int? rgNumber;
  String rgNumberEdcensoOrganIdEmitterFk;
  String rgNumberEdcensoUfFk;
  String? rgNumberExpedictionDate;
  int? civilCertification;
  int? civilCertificationType;
  String? civilCertificationTermNumber;
  String? civilCertificationSheet;
  String? civilCertificationBook;
  String? civilCertificationDate;
  String notaryOfficeUfFk;
  String notaryOfficeCityFk;
  String? edcensoNotaryOfficeFk;
  String? civilRegisterEnrollmentNumber;
  String? cpf;
  String? foreignDocumentOrPassport;
  String? nis;
  int residenceZone;
  int? diffLocation;
  String? cep;
  String? address;
  String? number;
  String? complement;
  String? neighborhood;
  String edcensoUfFk;
  String edcensoCityFk;
  bool? receivedCc;
  bool? receivedAddress;
  bool? receivedPhoto;
  bool? receivedNis;
  bool? receivedHistory;
  bool? receivedResponsableRg;
  bool? receivedResponsableCpf;
  String? cns;
  int? hash;
  bool? justiceRestriction;

  StudentEnrollment({
    this.registerType,
    required this.schoolInepIdFk,
    required this.studentFk,
    required this.oldId,
    this.rgNumber,
    required this.rgNumberEdcensoOrganIdEmitterFk,
    required this.rgNumberEdcensoUfFk,
    this.rgNumberExpedictionDate,
    this.civilCertification,
    this.civilCertificationType,
    this.civilCertificationTermNumber,
    this.civilCertificationSheet,
    this.civilCertificationBook,
    this.civilCertificationDate,
    required this.notaryOfficeUfFk,
    required this.notaryOfficeCityFk,
    this.edcensoNotaryOfficeFk,
    this.civilRegisterEnrollmentNumber,
    this.cpf,
    this.foreignDocumentOrPassport,
    this.nis,
    required this.residenceZone,
    this.diffLocation,
    this.cep,
    this.address,
    this.number,
    this.complement,
    this.neighborhood,
    required this.edcensoUfFk,
    required this.edcensoCityFk,
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
  });
}
