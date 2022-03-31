import 'package:br_ipti_tag_app/app/features/student/domain/usecases/list_student_usecase.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'student_list_states.dart';

class StudentListBloc extends Cubit<StudentListState> {
  StudentListBloc(this._listClassromsUsecase) : super(const EmptyState());

  final ListStudentsUsecase _listClassromsUsecase;
  final session = Modular.get<SessionBloc>();

  void startLoading() {
    emit(state.copyWith(loading: true));
  }

  void stopLoading() {
    emit(state.copyWith(loading: false));
  }

  Future<void> fetchListStudentsEvent() async {
    startLoading();

    final schoolId = session.state.currentSchool!.id!;

    final resultEither =
        await _listClassromsUsecase(ListStudentsParams(schoolId));
    resultEither.fold(
      (Exception failure) => emit(FailedState(message: failure.toString())),
      (students) => emit(LoadedState(students: students)),
    );
    stopLoading();
  }
}
