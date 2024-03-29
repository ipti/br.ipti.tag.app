import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'classroom_list_states.dart';

class ClassroomListBloc extends Cubit<ClassroomListState> {
  ClassroomListBloc(this._listClassromsUsecase) : super(const EmptyState());

  final ListClassroomsUsecase _listClassromsUsecase;

  void startLoading() {
    emit(state.copyWith(loading: true));
  }

  void stopLoading() {
    emit(state.copyWith(loading: false));
  }

  Future<void> fetchListClassroomsEvent() async {
    startLoading();
    final resultEither = await _listClassromsUsecase(ClassroomParams());
    resultEither.fold(
      (Exception failure) => emit(FailedState(message: failure.toString())),
      (classrooms) => emit(LoadedState(classrooms: classrooms)),
    );
    stopLoading();
  }
}
