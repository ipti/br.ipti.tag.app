import 'package:bloc/bloc.dart';
import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/usecases/list_teachers_usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/list/bloc/teacher_state.dart';

class TeacherListBloc extends Cubit<TeacherListState> {
  TeacherListBloc(this._listTeachersUsecase) : super(const EmptyState());

  final ListTeachersUsecase _listTeachersUsecase;

  void startLoading() {
    emit(state.copyWith(loading: true));
  }

  void stopLoading() {
    emit(state.copyWith(loading: false));
  }

  Future<void> fetchListTeachersEvent() async {
    startLoading();
    final resultEither = await _listTeachersUsecase(NoParams());
    resultEither.fold(
      (Exception failure) => emit(FailedState(message: failure.toString())),
      (teachers) => emit(LoadedState(teachers: teachers)),
    );
    stopLoading();
  }
}
