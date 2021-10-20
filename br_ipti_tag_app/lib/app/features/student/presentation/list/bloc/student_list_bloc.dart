import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/list_student_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_list_states.dart';

class StudentListBloc extends Cubit<StudentListState> {
  StudentListBloc(this._listClassromsUsecase) : super(const EmptyState());

  final ListStudentsUsecase _listClassromsUsecase;

  void startLoading() {
    emit(state.copyWith(loading: true));
  }

  void stopLoading() {
    emit(state.copyWith(loading: false));
  }

  Future<void> fetchListStudentsEvent() async {
    startLoading();
    final resultEither = await _listClassromsUsecase(NoParams());
    resultEither.fold(
      (Exception failure) => emit(FailedState(message: failure.toString())),
      (students) => emit(LoadedState(students: students)),
    );
    stopLoading();
  }
}
