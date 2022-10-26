import 'dart:developer';

import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/core/util/util.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/domain/entities/edcenso_discipline.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_disciplines/domain/usecases/list_disciplines_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/list_student_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'frequency_state.dart';

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
      NoParams(),
    );

    resultEither.fold(
      (Exception failure) {
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

    final schoolId = currentSchool.inepId!;

    final resultEither = await _listStudentUsecase(
      ListStudentsParams(schoolId),
    );

    resultEither.fold(
      (Exception failure) {
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
