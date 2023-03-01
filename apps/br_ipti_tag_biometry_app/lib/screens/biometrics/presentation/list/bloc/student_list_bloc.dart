import 'package:br_ipti_tag_biometry_app/core/status_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'student_list_states.dart';

class StudentListBloc extends Cubit<StudentListState> {
  StudentListBloc(this._listClassromsUsecase)
      : super(const StudentListState(status: Status.initial, students: []));

  final ListStudentsUsecase _listClassromsUsecase;
  final session = Modular.get<AuthRepository>();

  void startLoading() {
    emit(
      state.copyWith(status: Status.loading),
    );
  }

  Future<void> fetchListStudents() async {
    startLoading();

    final currentSchool = await session.getCurrentUserSchools();

    currentSchool.fold(
        (failure) => emit(
              state.copyWith(
                status: Status.failure,
                error: failure.toString(),
              ),
            ), (schools) async {
      final schoolId = schools.first.inepId;
      final resultEither = await _listClassromsUsecase(
        ListStudentsParams(schoolId),
      );
      resultEither.fold(
        (failure) => emit(
          state.copyWith(
            status: Status.failure,
            error: failure.toString(),
          ),
        ),
        (students) => emit(
          state.copyWith(
            status: Status.success,
            students: students,
          ),
        ),
      );
    });
  }
}
