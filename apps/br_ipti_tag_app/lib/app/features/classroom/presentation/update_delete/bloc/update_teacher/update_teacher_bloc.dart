import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/update_teacher/update_teacher_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../../../../../teacher/domain/usecases/list_teachers_usecase.dart';
import '../../../../domain/usecases/list_instructors_teaching_data_usecase.dart';

final initialState = UpdateTeacherStateLoading();

class UpdateTeacherBloc extends Cubit<UpdateTeacherState> {
  UpdateTeacherBloc(
    this._instructorsTeachingDataUseCase,
    this._disciplinesUseCase,
    this._instructorsUseCase,
  ) : super(initialState);

  final ListInstructorsTeachingDataUseCase _instructorsTeachingDataUseCase;
  final ListEdcensoDisciplineUsecase _disciplinesUseCase;
  final ListInstructorsUsecase _instructorsUseCase;
  late int? _classroomId;
  set classroomId(int classroomId) => _classroomId = classroomId;
  int get classroomId => _classroomId!;

  Future<void> fetchListClassroomsEvent() async {
    final requests = await Future.wait([
      _instructorsTeachingDataUseCase(
        ListInstructorsTeachingDataParams(
          classroomId: _classroomId!,
        ),
      ),
      _disciplinesUseCase(
        EmptyParams(),
      ),
      _instructorsUseCase(
        EmptyParams(),
      ),
    ]);
    List<InstructorTeachingDataEntity> instructorsTeachingData = [];
    List<EdcensoDiscipline> edcensoDisciplines = [];
    List<Instructor> instructors = [];

    requests.first.fold(
      (l) => null,
      (instructorsTeachingResponse) => instructorsTeachingData =
          instructorsTeachingResponse as List<InstructorTeachingDataEntity>,
    );

    requests[1].fold(
      (l) => null,
      (disciplinesResponse) =>
          edcensoDisciplines = disciplinesResponse as List<EdcensoDiscipline>,
    );

    requests.last.fold(
      (l) => null,
      (instructorsResponse) =>
          instructors = instructorsResponse as List<Instructor>,
    );

    if (instructorsTeachingData.isNotEmpty && edcensoDisciplines.isNotEmpty) {
      emit(
        UpdateTeacherStateSuccess(
          _bindInstructorsTeachingData(instructorsTeachingData, instructors),
          _bindDisciplines(
            edcensoDisciplines,
            instructorsTeachingData.map((e) => e.disciplineId).toList(),
          ),
          instructorsTeachingData,
        ),
      );
    } else {
      emit(
        UpdateTeacherStateEmpty(),
      );
    }
  }

  List<List<EdcensoDiscipline>> _bindDisciplines(
    List<EdcensoDiscipline> edcensoDisciplines,
    List<int> instructorDisciplines,
  ) {
    final List<List<EdcensoDiscipline>> instructorDisciplinesResult = [];
    for (final userDiscipline in instructorDisciplines) {
      instructorDisciplinesResult.addAll(
        edcensoDisciplines
            .where(
              (discipline) => discipline.id == userDiscipline,
            )
            .map((e) => [e]),
      );
    }

    return instructorDisciplinesResult;
  }

  List<Instructor> _bindInstructorsTeachingData(
    List<InstructorTeachingDataEntity> instructorsTeachingData,
    List<Instructor> instructors,
  ) {
    final List<Instructor> instructorsTeachingDataResult = [];
    for (final instructorTeaching in instructorsTeachingData) {
      instructorsTeachingDataResult.addAll(instructors.where(
        (instructor) => instructorTeaching.instructorFk == instructor.id,
      ));
    }

    return instructorsTeachingDataResult;
  }
}
