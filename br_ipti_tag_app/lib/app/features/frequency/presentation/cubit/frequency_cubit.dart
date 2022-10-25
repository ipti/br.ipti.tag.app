import 'dart:developer';

import 'package:br_ipti_tag_app/app/core/util/util.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'frequency_state.dart';

class FrequencyCubit extends Cubit<FrequencyState> {
  FrequencyCubit(this._listClassromsUsecase) : super(const EmptyState());

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
      (Exception failure) {
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
