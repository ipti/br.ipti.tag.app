import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_teaching_data_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_edcenso_disciplines_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_teaching_data_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/update_teacher/update_teacher_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final initialState = UpdateTeacherStateLoading();

class UpdateTeacherBloc extends Cubit<UpdateTeacherState> {
  UpdateTeacherBloc(this._instructorsTeachingDataUseCase,
      this._disciplinesUseCase, this._instructorsUseCase)
      : super(initialState);

  final ListInstructorsTeachingDataUseCase _instructorsTeachingDataUseCase;
  final ListEdcensoDisciplinesUseCase _disciplinesUseCase;
  final ListInstructorsUseCase _instructorsUseCase;
  late String? _classroomId;
  set classroomId(String classroomId) => _classroomId = classroomId;
  String get classroomId => _classroomId!;

  Future<void> fetchListClassroomsEvent() async {
    final requests = await Future.wait([
      _instructorsTeachingDataUseCase(
          ListInstructorsTeachingDataParams(classroomId: _classroomId!)),
      _disciplinesUseCase(NoParams()),
      _instructorsUseCase(NoParams())
    ]);
    List<InstructorTeachingDataEntity> instructorsTeachingData = [];
    List<EdcensoDisciplinesEntity> edcensoDisciplines = [];
    List<InstructorEntity> instructors = [];

    requests.first.fold(
        (l) => null,
        (instructorsTeachingResponse) => instructorsTeachingData =
            instructorsTeachingResponse as List<InstructorTeachingDataEntity>);

    requests[1].fold(
        (l) => null,
        (disciplinesResponse) => edcensoDisciplines =
            disciplinesResponse as List<EdcensoDisciplinesEntity>);

    requests.last.fold(
        (l) => null,
        (instructorsResponse) =>
            instructors = instructorsResponse as List<InstructorEntity>);

    if (instructorsTeachingData.isNotEmpty && edcensoDisciplines.isNotEmpty) {
      emit(UpdateTeacherStateSuccess(
          _bindInstructorsTeachingData(instructorsTeachingData, instructors),
          _bindDisciplines(edcensoDisciplines,
              instructorsTeachingData.map((e) => e.disciplineId).toList())));
    } else {
      emit(UpdateTeacherStateEmpty());
    }
  }

  List<List<EdcensoDisciplinesEntity>> _bindDisciplines(
    List<EdcensoDisciplinesEntity> edcensoDisciplines,
    List<String> instructorDisciplines,
  ) {
    final List<List<EdcensoDisciplinesEntity>> instructorDisciplinesResult = [];
    for (final userDiscipline in instructorDisciplines) {
      instructorDisciplinesResult.addAll(edcensoDisciplines
          .where((discipline) => discipline.id.contains(userDiscipline))
          .map((e) => [e]));
    }
    return instructorDisciplinesResult;
  }

  List<InstructorEntity> _bindInstructorsTeachingData(
    List<InstructorTeachingDataEntity> instructorsTeachingData,
    List<InstructorEntity> instructors,
  ) {
    final List<InstructorEntity> instructorsTeachingDataResult = [];
    for (final instructorTeaching in instructorsTeachingData) {
      instructorsTeachingDataResult.addAll(instructors.where((instructor) =>
          instructorTeaching.instructorFk.contains(instructor.id)));
    }
    return instructorsTeachingDataResult;
  }
}
