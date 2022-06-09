import 'package:br_ipti_tag_app/app/features/school/data/models/school_model.dart';
import 'package:equatable/equatable.dart';

class SchoolState extends Equatable {
  const SchoolState({
    required this.loading,
    required this.sending,
    required this.message,
    required this.currentSchoolData,
  });

  final bool loading;
  final bool sending;
  final String message;
  final SchoolModel? currentSchoolData;

  @override
  List<Object> get props => [loading, sending, message];

  SchoolState copyWith({
    bool? loading,
    bool? sending,
    String? message,
    SchoolModel? currentSchool,
  }) {
    return SchoolState(
      loading: loading ?? this.loading,
      sending: sending ?? this.sending,
      message: message ?? this.message,
      currentSchoolData: currentSchool ?? currentSchoolData,
    );
  }
}

class SchoolEmptyState extends SchoolState {
  const SchoolEmptyState()
      : super(
          loading: false,
          sending: false,
          message: "",
          currentSchoolData: null,
        );
}

class SchoolInitialState extends SchoolState {
  const SchoolInitialState()
      : super(
          loading: true,
          sending: false,
          message: "",
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
          currentSchoolData: null,
        );
}

class SchoolLoadingState extends SchoolState {
  const SchoolLoadingState()
      : super(
          loading: true,
          sending: false,
          message: "Carregando dados da escola",
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
          currentSchoolData: currentSchool,
        );
}

class SchoolSendingState extends SchoolState {
  const SchoolSendingState({
    required SchoolModel currentSchool,
  }) : super(
          loading: true,
          sending: false,
          message: "Enviando",
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
          currentSchoolData: currentSchool,
        );
}
