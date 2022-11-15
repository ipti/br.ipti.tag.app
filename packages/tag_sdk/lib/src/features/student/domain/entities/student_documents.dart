class StudentDocsAddress {
  String? id;
  String? registerType;
  String schoolInepIdFk;
  int studentFk;
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
  int edcensoUfFk;
  int edcensoCityFk;

  StudentDocsAddress({
    this.id,
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

  // ignore: long-method
  StudentDocsAddress copyWith({
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
    int? residenceZone,
    int? diffLocation,
    String? cep,
    String? address,
    String? number,
    String? complement,
    String? neighborhood,
    int? edcensoUfFk,
    int? edcensoCityFk,
  }) {
    return StudentDocsAddress(
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
      residenceZone: residenceZone ?? this.residenceZone,
      diffLocation: diffLocation ?? this.diffLocation,
      cep: cep ?? this.cep,
      address: address ?? this.address,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      neighborhood: neighborhood ?? this.neighborhood,
      edcensoUfFk: edcensoUfFk ?? this.edcensoUfFk,
      edcensoCityFk: edcensoCityFk ?? this.edcensoCityFk,
    );
  }
}
