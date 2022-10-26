// ignore_for_file: avoid_positional_boolean_parameters

import 'package:br_ipti_tag_app/app/features/teacher/domain/enums/color_race_enum.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/enums/filliation_type_enum.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/enums/nationality_enum.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/enums/scholarity_enum.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/enums/sex_enum.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/bloc/create_instructor_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../bloc/instructor_states.dart';
import 'instructor_personal_states.dart';

class InstructorPersonalBloc extends Cubit<InstructorPersonalState> {
  InstructorPersonalBloc()
      : super(
          const EmptyInstructorPersonalState(),
        );

  final _createInstructorBloc = Modular.get<CreateInstructorBloc>();

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

  Future loadInstructor(InstructorFormState instructor) async {
    final loadState = state.copyWith(
      name: instructor.name,
      cpf: instructor.cpf,
      email: instructor.email,
      scholarity: instructor.scholarity,
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
    );

    emit(loadState);
  }

  void setName(String value) => emit(
        state.copyWith(name: value),
      );
  void setCPF(String value) => emit(
        state.copyWith(cpf: value),
      );
  void setEmail(String value) => emit(
        state.copyWith(email: value),
      );
  void setBirthday(String value) => emit(
        state.copyWith(birthdayDate: value),
      );
  void setSex(int? value) => emit(
        state.copyWith(sex: value),
      );
  void setColorRace(int? value) => emit(
        state.copyWith(colorRace: value),
      );
  void setFiliation(int? value) => emit(
        state.copyWith(filiation: value),
      );
  void setNationality(int? value) => emit(
        state.copyWith(nationality: value),
      );
  void setScholarity(int? value) => emit(
        state.copyWith(scholarity: value),
      );

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
      emit(
        state.copyWith(deficiency: deficiency),
      );
    } else {
      emit(
        state.copyWith(
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
        ),
      );
    }
  }

  void setDeficiencyTypeBlindness(bool? typeBlindness) => emit(
        state.copyWith(deficiencyTypeBlindness: typeBlindness),
      );
  void setDeficiencyTypeLowVision(bool? typeLowVision) => emit(
        state.copyWith(deficiencyTypeLowVision: typeLowVision),
      );
  void setDeficiencyTypeDeafness(bool? typeDeafness) => emit(
        state.copyWith(deficiencyTypeDeafness: typeDeafness),
      );
  void setDeficiencyTypeDisabilityHearing(bool? typeDisabilityHearing) => emit(
        state.copyWith(deficiencyTypeDisabilityHearing: typeDisabilityHearing),
      );
  void setDeficiencyTypeDeafblindness(bool? typeDeafblindness) => emit(
        state.copyWith(deficiencyTypeDeafblindness: typeDeafblindness),
      );
  void setDeficiencyTypePhisicalDisability(bool? typePhisicalDisability) =>
      emit(
        state.copyWith(
          deficiencyTypePhisicalDisability: typePhisicalDisability,
        ),
      );
  void setDeficiencyTypeIntelectualDisability(
    bool? typeIntelectualDisability,
  ) =>
      emit(
        state.copyWith(
          deficiencyTypeIntelectualDisability: typeIntelectualDisability,
        ),
      );
  void setDeficiencyTypeMultipleDisabilities(bool? typeMultipleDisabilities) =>
      emit(
        state.copyWith(
          deficiencyTypeMultipleDisabilities: typeMultipleDisabilities,
        ),
      );
  void setDeficiencyTypeAutism(bool? typeAutism) => emit(
        state.copyWith(deficiencyTypeAutism: typeAutism),
      );

  void setDeficiencyTypeGifted(bool? typeGifted) => emit(
        state.copyWith(deficiencyTypeGifted: typeGifted),
      );

  Future<void> submitPersonalForm() async {
    _createInstructorBloc.loadPersonalData(
      personal: state,
    );
    _createInstructorBloc.goToTab(1);
  }

  void autoUpdate() {
    stream.listen((event) {
      _createInstructorBloc.loadPersonalData(personal: event);
    });
  }
}
