import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

abstract class SchoolState extends Equatable {
  const SchoolState({
    required this.loading,
    required this.sending,
    required this.message,
    required this.messageColor,
    required this.currentSchoolData,
  });

  final bool loading;
  final bool sending;
  final String message;
  final Color? messageColor;
  final SchoolModel? currentSchoolData;

  @override
  List<Object> get props => [loading, sending, message];
}

class SchoolEmptyState extends SchoolState {
  const SchoolEmptyState()
      : super(
          loading: false,
          sending: false,
          message: "",
          messageColor: null,
          currentSchoolData: null,
        );
}

class SchoolInitialState extends SchoolState {
  const SchoolInitialState()
      : super(
          loading: true,
          sending: false,
          message: "",
          messageColor: null,
          currentSchoolData: null,
        );
}

class SchoolFailedState extends SchoolState {
  const SchoolFailedState({
    required String message,
  }) : super(
          loading: false,
          sending: false,
          message: message,
          messageColor: TagColors.colorRedLight,
          currentSchoolData: null,
        );
}

class SchoolLoadingState extends SchoolState {
  const SchoolLoadingState()
      : super(
          loading: true,
          sending: false,
          message: "Carregando dados da escola",
          messageColor: TagColors.colorBaseBlueNormal,
          currentSchoolData: null,
        );
}

class SchoolLoadedState extends SchoolState {
  const SchoolLoadedState({
    required SchoolModel currentSchool,
  }) : super(
          loading: false,
          sending: false,
          message: "Dados da escola carregados",
          messageColor: TagColors.colorBaseProductSecondary,
          currentSchoolData: currentSchool,
        );
}

class SchoolSendingState extends SchoolState {
  const SchoolSendingState({
    SchoolModel? currentSchool,
  }) : super(
          loading: true,
          sending: false,
          message: "Enviando",
          messageColor: TagColors.colorBaseBlueNormal,
          currentSchoolData: currentSchool,
        );
}

class SchoolSentState extends SchoolState {
  const SchoolSentState({
    required SchoolModel currentSchool,
  }) : super(
          loading: false,
          sending: false,
          message: "Enviado",
          messageColor: TagColors.colorBaseProductSecondary,
          currentSchoolData: currentSchool,
        );
}

class SchoolSentFailState extends SchoolState {
  const SchoolSentFailState({
    required SchoolModel currentSchool,
  }) : super(
          loading: false,
          sending: false,
          message: "Falha no envio",
          messageColor: TagColors.colorRedLight,
          currentSchoolData: currentSchool,
        );
}

class SchoolDataChangeState extends SchoolState {
  const SchoolDataChangeState({
    required SchoolModel currentSchool,
  }) : super(
          loading: false,
          sending: false,
          message: "",
          messageColor: TagColors.colorBaseBlueNormal,
          currentSchoolData: currentSchool,
        );
}
