import 'package:br_ipti_tag_app/app/features/student/domain/entities/deficiency.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/filiation.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/responsable.dart';

class Student {
  Student({
    this.id,
    this.registerType,
    this.schoolInepIdFk,
    this.inepId,
    this.nis,
    this.name,
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
    this.edcensoDistrictFk,
    this.deficiency = false,
    this.deficiencies,
    this.sendYear,
    this.lastChange,
    this.responsable,
    this.bfParticipator = false,
    this.foodRestrictions,
    this.hash,
  });

  String? id;
  String? registerType;
  String? schoolInepIdFk;
  String? inepId;
  String? nis;
  String? name;
  String? birthday;
  int? sex;
  int? colorRace;
  int? filiation;
  int? nationality;
  int? noDocumentDesc;
  int? scholarity;
  String? idEmail;
  String? edcensoNationFk;
  String? edcensoUfFk;
  String? edcensoCityFk;
  String? edcensoDistrictFk;
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
