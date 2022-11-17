import 'dart:developer';

import 'package:br_ipti_tag_app/app/core/util/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'frequency_state.dart';

class FrequencyCubit extends Cubit<FrequencyState> {
  FrequencyCubit(
    this._listClassromsUsecase,
    this._listEdcensoDisciplineUsecase,
    this._listStudentUsecase,
  ) : super(const EmptyState());

  final ListClassroomsUsecase _listClassromsUsecase;
  final ListEdcensoDisciplineUsecase _listEdcensoDisciplineUsecase;
  final ListStudentsUsecase _listStudentUsecase;

  final session = Modular.get<SessionBloc>();

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
          emit(LoadedState(
            classrooms: classrooms,
            disciplines: state.disciplines,
            students: state.students,
          ));
        }
      },
    );
  }

  Future<void> fetchListDisciplinesEvent() async {
    startLoading();

    final resultEither = await _listEdcensoDisciplineUsecase(
      EmptyParams(),
    );

    resultEither.fold(
      (failure) {
        log(failure.toString());
        emit(FailedState(
          message: failure.toString(),
        ));
      },
      (disciplines) {
        if (disciplines.isEmpty) {
          emit(const EmptyState());
        } else {
          emit(LoadedState(
            classrooms: state.classrooms,
            disciplines: disciplines,
            students: state.students,
          ));
        }
      },
    );
  }

  Future<void> fetchListStudentEvent() async {
    startLoading();

    final currentSchool = await session.fetchCurrentSchool();

    final schoolId = currentSchool.inepId;

    final resultEither = await _listStudentUsecase(
      ListStudentsParams(schoolId),
    );

    resultEither.fold(
      (failure) {
        log(failure.toString());
        emit(FailedState(
          message: failure.toString(),
        ));
      },
      (students) {
        if (students.isEmpty) {
          emit(const EmptyState());
        } else {
          emit(LoadedState(
            classrooms: state.classrooms,
            disciplines: state.disciplines,
            students: students,
          ));
        }
      },
    );
  }
}
