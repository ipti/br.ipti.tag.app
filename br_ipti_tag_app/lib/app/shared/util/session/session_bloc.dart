import 'package:br_ipti_tag_app/app/core/plataform/session_service.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/entities/school.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionBloc extends Cubit<SessionState> {
  SessionBloc(this._sessionService) : super(SessionInitial());

  final SessionService _sessionService;

  Future changeSchool(School school) async {
    _sessionService.setCurrentSchool(school);
    emit(state.copyWith(currentSchool: school));
  }

  Future fetchSchools() async {
    final schools = await _sessionService.getCurrentUserSchools();
    emit(state.copyWith(
      schools: schools,
    ));
  }

  Future fetchCurrentSchool() async {
    final currentSchool = await _sessionService.getCurrentSchool();
    emit(state.copyWith(currentSchool: currentSchool));
  }
}

class SessionState {
  final School? currentSchool;
  final List<School>? schools;

  SessionState({
    this.currentSchool,
    this.schools,
  });

  SessionState copyWith({
    School? currentSchool,
    List<School>? schools,
  }) {
    return SessionState(
      currentSchool: currentSchool ?? this.currentSchool,
      schools: schools ?? this.schools,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is SessionState &&
        other.currentSchool == currentSchool &&
        listEquals(other.schools, schools);
  }

  @override
  int get hashCode => currentSchool.hashCode ^ schools.hashCode;
}

class SessionInitial extends SessionState {}
