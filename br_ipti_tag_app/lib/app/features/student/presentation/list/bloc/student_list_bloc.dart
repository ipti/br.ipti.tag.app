import 'package:br_ipti_tag_app/app/features/student/domain/usecases/list_student_usecase.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'student_list_states.dart';

class StudentListBloc extends Cubit<StudentListState> {
  StudentListBloc(this._listClassromsUsecase)
      : super(
          const StudentListState(status: Status.initial, students: []),
        );

  final ListStudentsUsecase _listClassromsUsecase;
  final session = Modular.get<SessionBloc>();

  void startLoading() {
    emit(
      state.copyWith(status: Status.loading),
    );
  }

  Future<void> fetchListStudents() async {
    startLoading();

    final currentSchool = await session.fetchCurrentSchool();

    final schoolId = currentSchool.inepId!;

    final resultEither = await _listClassromsUsecase(
      ListStudentsParams(schoolId),
    );
    resultEither.fold(
      (Exception failure) => emit(
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
  }
}
