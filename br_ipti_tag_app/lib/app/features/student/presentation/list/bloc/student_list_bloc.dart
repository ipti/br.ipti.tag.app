import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/list_classrooms_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_list_events.dart';
import 'student_list_states.dart';

class StudentListBloc extends Bloc<StudentListEvent, StudentListState> {
  StudentListBloc(this._listClassromsUsecase) : super(EmptyState());

  final ListStudentsUsecase _listClassromsUsecase;

  @override
  Stream<StudentListState> mapEventToState(StudentListEvent event) async* {
    if (event is GetListStudentsEvent) {
      yield LoadingState();
      final resultEither = await _listClassromsUsecase(NoParams());
      yield resultEither.fold(
        (Exception failure) {
          return FailedState(message: failure.toString());
        },
        (students) {
          return LoadedState(students: students);
        },
      );
    }
  }
}
