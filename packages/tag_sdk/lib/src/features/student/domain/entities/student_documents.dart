import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_documents.freezed.dart';
part 'student_documents.g.dart';

@freezed
class StudentDocsAndAddress with _$StudentDocsAndAddress {
  const factory StudentDocsAndAddress({
    int? id,
    String? registerType,
    String? schoolIdentification,
    int? studentFk,
    String? rgNumber,
    int? edcensoOrganIdEmitter,
    int? edcensoUfEdcensoUfTostudentDocumentsAndAddressRgNumberEdcensoUfFk,
    int? rgNumberExpedictionDate,
    int? civilCertification,
    int? civilCertificationType,
    String? civilCertificationTermNumber,
    String? civilCertificationSheet,
    String? civilCertificationBook,
    String? civilCertificationDate,
    @JsonKey(
        name:
            "edcenso_uf_edcenso_ufTostudent_documents_and_address_notary_office_uf_fk")
        int? notaryOfficeUfFk,
    @JsonKey(
        name:
            "edcenso_city_edcenso_cityTostudent_documents_and_address_notary_office_city_fk")
        int? notaryOfficeCityFk,
    int? edcensoNotaryOfficeFk,
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
    @JsonKey(
        name:
            "edcenso_uf_edcenso_ufTostudent_documents_and_address_edcenso_uf_fk")
        int? edcensoUfFk,
    @JsonKey(
        name:
            "edcenso_city_edcenso_cityTostudent_documents_and_address_edcenso_city_fk")
        int? edcensoCityFk,
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
  }) = _StudentDocsAndAddress;

  factory StudentDocsAndAddress.fromJson(Map<String, Object?> json) =>
      _$StudentDocsAndAddressFromJson(json);
}
