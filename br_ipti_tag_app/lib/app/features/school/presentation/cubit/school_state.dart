import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';
import 'package:equatable/equatable.dart';

class SchoolState extends Equatable {
  const SchoolState({
    required this.loading,
    required this.sending,
    required this.message,
    // required this.currentSchool,
  });

  final bool loading;
  final bool sending;
  final String message;
  // final SchoolEntity currentSchool;

  @override
  List<Object> get props => [loading, message];

  SchoolState copyWith({
    bool? loading,
    bool? sending,
    String? message,
    // SchoolEntity? currentSchool,
  }) {
    return SchoolState(
      loading: loading ?? this.loading,
      sending: sending ?? this.sending,
      message: message ?? this.message,
      // currentSchool: currentSchool ?? this.currentSchool,
    );
  }
}

class SchoolEmptyState extends SchoolState {
  const SchoolEmptyState()
      : super(
          loading: false,
          sending: false,
          message: "",
          // currentSchool: const SchoolEntity(),
        );
}

class SchoolInitialState extends SchoolState {
  const SchoolInitialState()
      : super(
          loading: false,
          sending: false,
          message: "",
          // currentSchool: const SchoolEntity(),
        );
}

class SchoolLoadingState extends SchoolState {
  const SchoolLoadingState()
      : super(
          loading: false,
          sending: false,
          message: "",
          // currentSchool: const SchoolEntity(),
        );
}

class SchoolLoadedState extends SchoolState {
  const SchoolLoadedState({required SchoolEntity currentSchool})
      : super(
          loading: false,
          sending: false,
          message: "",
          // currentSchool: currentSchool,
        );
}

class SchoolFailedState extends SchoolState {
  const SchoolFailedState({
    required String message,
  }) : super(
          loading: false,
          sending: false,
          message: message,
          // currentSchool: const SchoolEntity(),
        );
}
