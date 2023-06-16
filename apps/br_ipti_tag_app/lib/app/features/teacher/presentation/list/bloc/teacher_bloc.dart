import 'dart:developer';

import 'package:br_ipti_tag_app/app/core/util/util.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/list/bloc/teacher_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../../../domain/usecases/list_teachers_usecase.dart';


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
      EmptyParams(),
    );
    resultEither.fold(
      (failure) {
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
