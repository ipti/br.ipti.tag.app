import 'package:br_ipti_tag_app/app/features/student/domain/entities/deficiency.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/filiation.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/responsable.dart';

class Student {
  Student({
    this.registerType,
    this.schoolInepIdFk,
    this.inepId,
    this.nis,
    required this.name,
    this.birthday,
    this.sex,
    this.colorRace,
    this.filiation,
    this.filiation1,
    this.filiation2,
    this.nationality,
    this.noDocumentDesc,
    this.scholarity,
    this.idEmail,
    this.edcensoNationFk,
    this.edcensoUfFk,
    this.edcensoCityFk,
    this.deficiency = false,
    this.deficiencies,
    this.sendYear,
    this.lastChange,
    this.responsable,
    this.bfParticipator = false,
    this.foodRestrictions,
    this.hash,
  });

  String? registerType;
  String? schoolInepIdFk;
  String? inepId;
  String? nis;
  String name;
  String? birthday;
  int? sex;
  int? colorRace;
  int? filiation;
  int? nationality;
  int? noDocumentDesc;
  int? scholarity;
  String? idEmail;
  int? edcensoNationFk;
  int? edcensoUfFk;
  int? edcensoCityFk;
  bool deficiency;
  int? sendYear;
  String? lastChange;
  bool bfParticipator;
  String? foodRestrictions;
  int? hash;
  Deficiency? deficiencies;
  StudentResponsable? responsable;
  StudentFiliation? filiation1;
  StudentFiliation? filiation2;
}
