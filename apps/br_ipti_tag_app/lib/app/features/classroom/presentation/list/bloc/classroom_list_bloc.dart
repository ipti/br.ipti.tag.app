import 'dart:developer';

import 'package:br_ipti_tag_app/app/core/util/enums/status_fetch.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../../../domain/usecases/list_classrooms_usecase.dart';
import 'classroom_list_states.dart';

class ClassroomListBloc extends Cubit<ClassroomListState> {
  ClassroomListBloc(this._listClassromsUsecase)
      : super(
          const EmptyState(),
        );

  final ListClassroomsUsecase _listClassromsUsecase;

  void startLoading() {
    emit(
      state.copyWith(status: Status.loading),
    );
  }

  Future<void> fetchListClassroomsEvent() async {
    startLoading();
    final resultEither = await _listClassromsUsecase(
      ClassroomParams(),
    );
    resultEither.fold(
      (failure) {
        log(failure.toString());
        emit(FailedState(
          message: failure.toString(),
        ));
      },
      (classrooms) {
        if (classrooms.isEmpty) {
          emit(const EmptyState());
        } else {
          emit(LoadedState(classrooms: classrooms));
        }
      },
    );
  }
}
