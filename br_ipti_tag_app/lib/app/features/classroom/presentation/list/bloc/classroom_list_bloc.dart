import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'classroom_list_events.dart';
import 'classroom_list_states.dart';

class ClassroomListBloc extends Bloc<ClassroomListEvent, ClassroomListState> {
  ClassroomListBloc(this._listClassromsUsecase) : super(EmptyState());

  final ListClassroomsUsecase _listClassromsUsecase;

  @override
  Stream<ClassroomListState> mapEventToState(ClassroomListEvent event) async* {
    if (event is GetListClassroomsEvent) {
      yield LoadingState();
      final resultEither = await _listClassromsUsecase(NoParams());
      yield resultEither.fold(
        (failure) {
          return FailedState(message: failure.toString());
        },
        (classrooms) {
          return LoadedState(classrooms: classrooms);
        },
      );
    }
  }
}
