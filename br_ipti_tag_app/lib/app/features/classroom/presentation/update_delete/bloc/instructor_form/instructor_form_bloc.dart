import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructor_teaching_data_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/create_instructor_teaching_data_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_edcenso_disciplines_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_events.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final initialState = InstructorFormStateLoading();

class InstructorFormBloc
    extends Bloc<InstructorFormEvent, InstructorFormState> {
  InstructorFormBloc(this._instructorsUseCase, this._edcensoDisciplinesUseCase,
      this._createInstructorTeachingDataUseCase)
      : super(initialState);
  final ListEdcensoDisciplinesUseCase _edcensoDisciplinesUseCase;
  final ListInstructorsUseCase _instructorsUseCase;
  final CreateInstructorTeachingDataUseCase
      _createInstructorTeachingDataUseCase;

  Future<void> fetchInstructorsAndDisciplines(
      {String? instructorFk, String? instructorDiscipline}) async {
    final requests = await Future.wait([
      _instructorsUseCase(
          ListInstructorsParams(schoolId: '61a9433412656f31249d2aa2')),
      _edcensoDisciplinesUseCase(NoParams())
    ]);

    List<InstructorEntity> instructors = [];
    List<EdcensoDisciplinesEntity> disciplines = [];

    requests.first.fold(
        (l) => emit(InstructorFormStateError()),
        (instructorsResponse) =>
            instructors = instructorsResponse as List<InstructorEntity>);

    requests.last.fold(
        (l) => emit(InstructorFormStateError()),
        (disciplinesResponse) => disciplines =
            disciplinesResponse as List<EdcensoDisciplinesEntity>);

    if (instructors.isNotEmpty && disciplines.isNotEmpty) {
      changeCurrentInstructor(instructorFk ?? instructors.first.id);
      changeCurrentDiscipline(instructorDiscipline ?? disciplines.first.id);
      emit(InstructorFormStateSuccess(
          instructors: instructors, disciplines: disciplines));
    }
  }

  String? _currentInstructor;
  void changeCurrentInstructor(String selectedInstructorId) =>
      _currentInstructor = selectedInstructorId;
  String get currentInstructor => _currentInstructor!;

  String? _currentDiscipline;
  void changeCurrentDiscipline(String selectedDisciplineId) =>
      _currentDiscipline = selectedDisciplineId;
  String get currentDiscipline => _currentDiscipline!;

  String? _classroomId;
  void setClassroomId(String classroomId) => _classroomId = classroomId;

  @override
  Stream<InstructorFormState> mapEventToState(
      InstructorFormEvent event) async* {
    InstructorFormState newState = state;
    if (event is SubmitInstructorForm) {
      final params = InstructorTeachingDataCreateEntity(
          schoolInepIdFk: '61a9433412656f31249d2aa2',
          instructorFk: _currentInstructor!,
          classroomIdFk: _classroomId!,
          discipline1Fk: _currentDiscipline,
          role: 1);
      await _createInstructorTeachingDataUseCase(params);
    }
    if (event is LoadInstructorForm) {
      await fetchInstructorsAndDisciplines();
      newState = state;
    }
    if (event is UpdateInstructorForm) {
      await fetchInstructorsAndDisciplines(
          instructorFk: event.instructorFk,
          instructorDiscipline: event.discipline1Fk);
    }
    yield newState;
  }
}
