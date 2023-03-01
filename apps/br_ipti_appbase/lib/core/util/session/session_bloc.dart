import 'package:br_ipti_appbase/core/plataform/session_service.dart';


import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tag_sdk/tag_sdk.dart';

class SessionBloc extends Cubit<SessionState> {
  SessionBloc(this._sessionService)
      : super(
          SessionInitial(),
        );

  final SessionService _sessionService;

  Future changeSchool(AuthSchool school) async {
    _sessionService.setCurrentSchool(school);
    emit(
      state.copyWith(currentSchool: school),
    );
  }

  Future fetchSchools() async {
    final schools = await _sessionService.getCurrentUserSchools();
    emit(
      state.copyWith(
        schools: schools,
      ),
    );
  }

  Future<AuthSchool> fetchCurrentSchool() async {
    final currentSchool = await _sessionService.getCurrentSchool();
    emit(
      state.copyWith(currentSchool: currentSchool),
    );

    return currentSchool;
  }

  Future<String> getYear() async {
    final year = await _sessionService.getSchoolYear();
    emit(
      state.copyWith(year: year),
    );

    return year;
  }
}

class SessionState {
  final AuthSchool? currentSchool;
  final List<AuthSchool>? schools;
  final String? year;

  SessionState({
    this.currentSchool,
    this.schools,
    this.year,
  });

  SessionState copyWith({
    AuthSchool? currentSchool,
    List<AuthSchool>? schools,
    String? year,
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
