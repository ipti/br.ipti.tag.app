// ignore_for_file: avoid_positional_boolean_parameters

import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/enums/color_race_enum.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/enums/filliation_type_enum.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/enums/nationality_enum.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/enums/scholarity_enum.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/enums/sex_enum.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/usecases/create_instructor_usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/bloc/create_instructor_bloc.dart';

import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_personal_states.dart';

class InstructorPersonalBloc extends Cubit<InstructorPersonalState> {
  InstructorPersonalBloc(
    this._createStudentsUsecase,
  ) : super(const EmptyInstructorPersonalState());

  final CreateInstructorsUsecase _createStudentsUsecase;

  final _session = Modular.get<SessionBloc>();
  final _instructorBloc = Modular.get<CreateInstructorBloc>();

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

  final scholarityItems = Map.fromEntries(
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

  Future loadStudent(Instructor instructor) async {
    emit(state.copyWith(
      // instructor: instructor,
      name: instructor.name,
      birthdayDate: instructor.birthdayDate,
      sex: instructor.sex,
      colorRace: instructor.colorRace,
      filiation: instructor.filiation,
      nationality: instructor.nationality,
      deficiency: instructor.deficiency,
      deficiencyTypeBlindness: instructor.deficiencyTypeBlindness,
      deficiencyTypeLowVision: instructor.deficiencyTypeLowVision,
      deficiencyTypeDeafness: instructor.deficiencyTypeDeafness,
      deficiencyTypeDisabilityHearing:
          instructor.deficiencyTypeDisabilityHearing,
      deficiencyTypeDeafblindness: instructor.deficiencyTypeDeafblindness,
      deficiencyTypePhisicalDisability:
          instructor.deficiencyTypePhisicalDisability,
      deficiencyTypeIntelectualDisability:
          instructor.deficiencyTypeIntelectualDisability,
      deficiencyTypeMultipleDisabilities:
          instructor.deficiencyTypeMultipleDisabilities,
      deficiencyTypeAutism: instructor.deficiencyTypeAutism,

      deficiencyTypeGifted: instructor.deficiencyTypeGifted,
    ));
  }

  void setName(String value) => emit(state.copyWith(
        name: value,
      ));
  void setBirthday(String value) => emit(state.copyWith(birthdayDate: value));
  void setSex(int value) => emit(state.copyWith(sex: value));
  void setColorRace(int value) => emit(state.copyWith(colorRace: value));
  void setFiliation(bool value) => emit(state.copyWith(filiation: value));
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

  void setDeficiencyTypeGifted(bool? typeGifted) =>
      emit(state.copyWith(deficiencyTypeGifted: typeGifted));

  Future<void> submitPersonalForm(EditMode mode) async {
    switch (mode) {
      case EditMode.Create:
        _create();
        break;
      case EditMode.Edit:
        break;
    }
  }

  Future _create() async {
    final school = _session.state.currentSchool!;

    final instructor = Instructor(
      name: state.name,
      email: state.email,
      birthdayDate: state.birthdayDate,
      sex: state.sex,
      colorRace: state.colorRace,
      nationality: state.nationality,
      deficiency: state.deficiency,
      filiation: state.filiation,
      registerType: "rg",
      edcensoUfFk: school.edcensoUfFk,
      edcensoCityFk: school.edcensoCityFk,
      // edcensoDistrictFk: school.edcensoDistrictFk,
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
      deficiencyTypeGifted: state.deficiencyTypeGifted,
    );

    final result = await _createStudentsUsecase(
      CreateInstructorParams(instructor: instructor),
    );

    result.fold(
      (error) => _instructorBloc.notifyError(error.toString()),
      (student) {
        _instructorBloc.notifySuccess(
          "Dados básicos do aluno cadastrados com sucesso",
        );
        _instructorBloc.nextTab();
      },
    );
  }
}
