import 'dart:developer';

import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/core/util/enums/status_fetch.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/usecases/list_teachers_usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/list/bloc/teacher_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherListBloc extends Cubit<TeacherListState> {
  TeacherListBloc(this._listTeachersUsecase)
      : super(
          const EmptyState(),
        );

  final ListInstructorsUsecase _listTeachersUsecase;

  void startLoading() {
    emit(
      state.copyWith(status: Status.loading),
    );
  }

  Future<void> fetchListTeachersEvent() async {
    startLoading();
    final resultEither = await _listTeachersUsecase(
      NoParams(),
    );
    resultEither.fold(
      (Exception failure) {
        log(failure.toString());
        emit(FailedState(
          message: failure.toString(),
        ));
      },
      (teachers) {
        emit(
          LoadedState(teachers: teachers),
        );
      },
    );
  }
}
