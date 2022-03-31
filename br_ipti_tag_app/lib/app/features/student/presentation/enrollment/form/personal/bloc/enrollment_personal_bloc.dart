// ignore_for_file: avoid_positional_boolean_parameters

import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/color_race_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/filliation_type_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/nationality_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/scholarity_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/sex_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_student_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/update_student_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_bloc.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_personal_states.dart';

class EnrollmentPersonalBloc extends Cubit<EnrollmentPersonalState> {
  EnrollmentPersonalBloc(
    this._createStudentsUsecase,
    this._updateStudentsUsecase,
  ) : super(const EmptyEnrollmentPersonalState());

  final CreateStudentsUsecase _createStudentsUsecase;
  final UpdateStudentUsecase _updateStudentsUsecase;

  final _session = Modular.get<SessionBloc>();
  final _enrollmentBloc = Modular.get<EnrollmentBloc>();

  final sexItems = Map.fromEntries(
    Sex.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  final colorRaceItems = Map.fromEntries(
    ColorRace.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  final scholatiryItems = Map.fromEntries(
    Scholarity.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  final filiationItems = Map.fromEntries(
    FilliationType.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  final nationalityItems = Map.fromEntries(
    Nationality.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  Future loadStudent(Student student) async {
    emit(state.copyWith(
      student: student,
      name: student.name,
      birthday: student.birthday,
      sex: student.sex,
      colorRace: student.colorRace,
      filiation: student.filiation,
      nationality: student.nationality,
      deficiency: student.deficiency,
      foodRestrictions: student.foodRestrictions,
      deficiencyTypeBlindness: student.deficiencyTypeBlindness,
      deficiencyTypeLowVision: student.deficiencyTypeLowVision,
      deficiencyTypeDeafness: student.deficiencyTypeDeafness,
      deficiencyTypeDisabilityHearing: student.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafblindness: student.deficiencyTypeDeafblindness,
      deficiencyTypePhisicalDisability:
          student.deficiencyTypePhisicalDisability,
      deficiencyTypeIntelectualDisability:
          student.deficiencyTypeIntelectualDisability,
      deficiencyTypeMultipleDisabilities:
          student.deficiencyTypeMultipleDisabilities,
      deficiencyTypeAutism: student.deficiencyTypeAutism,
      deficiencyTypeAspengerSyndrome: student.deficiencyTypeAspengerSyndrome,
      deficiencyTypeRettSyndrome: student.deficiencyTypeRettSyndrome,
      deficiencyTypeChildhoodDisintegrativeDisorder:
          student.deficiencyTypeChildhoodDisintegrativeDisorder,
      deficiencyTypeGifted: student.deficiencyTypeGifted,
    ));
  }

  void setName(String value) => emit(state.copyWith(
        name: value,
      ));
  void setBirthday(String value) => emit(state.copyWith(birthday: value));
  void setSex(int value) => emit(state.copyWith(sex: value));
  void setColorRace(int value) => emit(state.copyWith(colorRace: value));
  void setFiliation(int value) => emit(state.copyWith(filiation: value));
  void setNationality(int value) => emit(state.copyWith(nationality: value));

  // Cegueira
  // Baixa visão
  // Surdez
  // Deficiência auditiva
  // Surdocegueira
  // Deficiência Física
  // Deficiência Intelectual
  // Deficiência Múltipla
  // Transtorno do Espectro Autista
  // Altas Habilidades / Super Dotação
  void setDeficiency(bool? deficiency) {
    if (deficiency!) {
      emit(state.copyWith(deficiency: deficiency));
    } else {
      emit(state.copyWith(
        deficiency: deficiency,
        deficiencyTypeBlindness: false,
        deficiencyTypeLowVision: false,
        deficiencyTypeDeafness: false,
        deficiencyTypeDisabilityHearing: false,
        deficiencyTypeDeafblindness: false,
        deficiencyTypePhisicalDisability: false,
        deficiencyTypeIntelectualDisability: false,
        deficiencyTypeMultipleDisabilities: false,
        deficiencyTypeAutism: false,
        deficiencyTypeAspengerSyndrome: false,
        deficiencyTypeRettSyndrome: false,
        deficiencyTypeChildhoodDisintegrativeDisorder: false,
        deficiencyTypeGifted: false,
      ));
    }
  }

  void setDeficiencyTypeBlindness(bool? typeBlindness) =>
      emit(state.copyWith(deficiencyTypeBlindness: typeBlindness));
  void setDeficiencyTypeLowVision(bool? typeLowVision) =>
      emit(state.copyWith(deficiencyTypeLowVision: typeLowVision));
  void setDeficiencyTypeDeafness(bool? typeDeafness) =>
      emit(state.copyWith(deficiencyTypeDeafness: typeDeafness));
  void setDeficiencyTypeDisabilityHearing(bool? typeDisabilityHearing) => emit(
      state.copyWith(deficiencyTypeDisabilityHearing: typeDisabilityHearing));
  void setDeficiencyTypeDeafblindness(bool? typeDeafblindness) =>
      emit(state.copyWith(deficiencyTypeDeafblindness: typeDeafblindness));
  void setDeficiencyTypePhisicalDisability(bool? typePhisicalDisability) =>
      emit(state.copyWith(
          deficiencyTypePhisicalDisability: typePhisicalDisability));
  void setDeficiencyTypeIntelectualDisability(
          bool? typeIntelectualDisability) =>
      emit(state.copyWith(
          deficiencyTypeIntelectualDisability: typeIntelectualDisability));
  void setDeficiencyTypeMultipleDisabilities(bool? typeMultipleDisabilities) =>
      emit(state.copyWith(
          deficiencyTypeMultipleDisabilities: typeMultipleDisabilities));
  void setDeficiencyTypeAutism(bool? typeAutism) =>
      emit(state.copyWith(deficiencyTypeAutism: typeAutism));
  void setDeficiencyTypeAspengerSyndrome(bool? typeAspengerSyndrome) => emit(
      state.copyWith(deficiencyTypeAspengerSyndrome: typeAspengerSyndrome));
  void setDeficiencyTypeRettSyndrome(bool? typeRettSyndrome) =>
      emit(state.copyWith(deficiencyTypeRettSyndrome: typeRettSyndrome));
  void setDeficiencyTypeChildhoodDisintegrativeDisorder(
          bool? typeChildhoodDisintegrativeDisorder) =>
      emit(state.copyWith(
          deficiencyTypeChildhoodDisintegrativeDisorder:
              typeChildhoodDisintegrativeDisorder));
  void setDeficiencyTypeGifted(bool? typeGifted) =>
      emit(state.copyWith(deficiencyTypeGifted: typeGifted));

  void setFoodRestriction(String value) => emit(
        state.copyWith(foodRestrictions: value),
      );

  Future<void> submitPersonalForm(EditMode mode) async {
    switch (mode) {
      case EditMode.Create:
        _create();
        break;
      case EditMode.Edit:
        _edit();
        break;
    }
  }

  Future _create() async {
    final school = _session.state.currentSchool!;
    final year = await _session.getYear();
    final student = Student(
      name: state.name,
      birthday: state.birthday,
      sex: state.sex,
      colorRace: state.colorRace,
      nationality: state.nationality,
      deficiency: state.deficiency,
      foodRestrictions: state.foodRestrictions,
      filiation: state.filiation,
      registerType: "rg",
      sendYear: int.parse(year),
      edcensoUfFk: school.edcensoUfFk,
      edcensoCityFk: school.edcensoCityFk,
      edcensoDistrictFk: school.edcensoDistrictFk,
      edcensoNationFk: "61ee3e877652254244a8b224",
      schoolInepIdFk: school.id,
      deficiencyTypeBlindness: state.deficiencyTypeBlindness,
      deficiencyTypeLowVision: state.deficiencyTypeLowVision,
      deficiencyTypeDeafness: state.deficiencyTypeDeafness,
      deficiencyTypeDisabilityHearing: state.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafblindness: state.deficiencyTypeDeafblindness,
      deficiencyTypePhisicalDisability: state.deficiencyTypePhisicalDisability,
      deficiencyTypeIntelectualDisability:
          state.deficiencyTypeIntelectualDisability,
      deficiencyTypeMultipleDisabilities:
          state.deficiencyTypeMultipleDisabilities,
      deficiencyTypeAutism: state.deficiencyTypeAutism,
      deficiencyTypeAspengerSyndrome: state.deficiencyTypeAspengerSyndrome,
      deficiencyTypeRettSyndrome: state.deficiencyTypeRettSyndrome,
      deficiencyTypeChildhoodDisintegrativeDisorder:
          state.deficiencyTypeChildhoodDisintegrativeDisorder,
      deficiencyTypeGifted: state.deficiencyTypeGifted,
    );

    final result = await _createStudentsUsecase(
      CreateStudentParams(
        student: student,
      ),
    );

    result.fold(id, (student) {
      _enrollmentBloc.setStudent(student);
      _enrollmentBloc.nextTab();
    });
  }

  Future _edit() async {
    final student = state.student!.copyWith(
      name: state.name,
      birthday: state.birthday,
      sex: state.sex,
      colorRace: state.colorRace,
      nationality: state.nationality,
      deficiency: state.deficiency,
      foodRestrictions: state.foodRestrictions,
      filiation: state.filiation,
      registerType: "rg",
      deficiencyTypeBlindness: state.deficiencyTypeBlindness,
      deficiencyTypeLowVision: state.deficiencyTypeLowVision,
      deficiencyTypeDeafness: state.deficiencyTypeDeafness,
      deficiencyTypeDisabilityHearing: state.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafblindness: state.deficiencyTypeDeafblindness,
      deficiencyTypePhisicalDisability: state.deficiencyTypePhisicalDisability,
      deficiencyTypeIntelectualDisability:
          state.deficiencyTypeIntelectualDisability,
      deficiencyTypeMultipleDisabilities:
          state.deficiencyTypeMultipleDisabilities,
      deficiencyTypeAutism: state.deficiencyTypeAutism,
      deficiencyTypeAspengerSyndrome: state.deficiencyTypeAspengerSyndrome,
      deficiencyTypeRettSyndrome: state.deficiencyTypeRettSyndrome,
      deficiencyTypeChildhoodDisintegrativeDisorder:
          state.deficiencyTypeChildhoodDisintegrativeDisorder,
      deficiencyTypeGifted: state.deficiencyTypeGifted,
    );

    final params = UpdateStudentParams(
      id: student.id!,
      student: student,
    );

    final result = await _updateStudentsUsecase(params);

    result.fold(id, (student) {
      _enrollmentBloc.setStudent(student);
      _enrollmentBloc.nextTab();
    });
  }
}
