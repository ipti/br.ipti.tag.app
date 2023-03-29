import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'instructor_form_events.dart';

class InstructorFormBloc
    extends Bloc<InstructorFormEvent, InstructorFormState> {
  InstructorFormBloc(
    this._instructorsUseCase,
    this._edcensoDisciplinesUseCase,
    this._createInstructorTeachingDataUseCase,
    this._updateInstructorTeachingDataUseCase,
  ) : super(InstructorFormStateLoading()) {
    on<SubmitInstructorForm>((event, emit) async {
      final params = InstructorTeachingDataCreateEntity(
        // TODO: Add school inep
        schoolInepIdFk: 1,
        instructorFk: _currentInstructor!,
        classroomIdFk: _classroomId!,
        discipline1Fk: selectedDisciplines[0],
        discipline2Fk: getIdDiscipline(selectedDisciplines, 1),
        discipline3Fk: getIdDiscipline(selectedDisciplines, 2),
        discipline4Fk: getIdDiscipline(selectedDisciplines, 3),
        discipline5Fk: getIdDiscipline(selectedDisciplines, 4),
        discipline6Fk: getIdDiscipline(selectedDisciplines, 5),
        discipline7Fk: getIdDiscipline(selectedDisciplines, 6),
        discipline8Fk: getIdDiscipline(selectedDisciplines, 7),
        discipline9Fk: getIdDiscipline(selectedDisciplines, 8),
        discipline10Fk: getIdDiscipline(selectedDisciplines, 9),
        discipline11Fk: getIdDiscipline(selectedDisciplines, 10),
        discipline12Fk: getIdDiscipline(selectedDisciplines, 11),
        discipline13Fk: getIdDiscipline(selectedDisciplines, 12),
        discipline14Fk: getIdDiscipline(selectedDisciplines, 13),
        discipline15Fk: getIdDiscipline(selectedDisciplines, 14),
        role: _role,
        contractType: _contractType,
      );
      final createInstructorRequestResponse =
          await _createInstructorTeachingDataUseCase(params);
      createInstructorRequestResponse.fold(
        (error) => add(
          InstructorFormEventInsertError(),
        ),
        (success) => add(
          InstructorFormEventInsertSuccess(),
        ),
      );
      emit(state);
    });
    on<SubmitUpdateInstructorForm>((event, emit) async {
      final params = UpdateInstructorTeachingDataParams(
        event.instructorTeachingDataId,
        InstructorTeachingDataUpdateEntity(
          role: _role,
          // contractType: _contractType,
          discipline1Fk: selectedDisciplines[0],
          discipline2Fk: getIdDiscipline(selectedDisciplines, 1),
          discipline3Fk: getIdDiscipline(selectedDisciplines, 2),
          discipline4Fk: getIdDiscipline(selectedDisciplines, 3),
          discipline5Fk: getIdDiscipline(selectedDisciplines, 4),
          discipline6Fk: getIdDiscipline(selectedDisciplines, 5),
          discipline7Fk: getIdDiscipline(selectedDisciplines, 6),
          discipline8Fk: getIdDiscipline(selectedDisciplines, 7),
          discipline9Fk: getIdDiscipline(selectedDisciplines, 8),
          discipline10Fk: getIdDiscipline(selectedDisciplines, 9),
          discipline11Fk: getIdDiscipline(selectedDisciplines, 10),
          discipline12Fk: getIdDiscipline(selectedDisciplines, 11),
          discipline13Fk: getIdDiscipline(selectedDisciplines, 12),
          discipline14Fk: getIdDiscipline(selectedDisciplines, 13),
          discipline15Fk: getIdDiscipline(selectedDisciplines, 14),
        ),
      );

      await _updateInstructorTeachingDataUseCase(params);
    });
    on<LoadInstructorForm>((event, emit) async {
      await fetchInstructorsAndDisciplines();
      emit(state);
    });
    on<UpdateInstructorForm>((event, emit) async {
      await fetchInstructorsAndDisciplines(
        instructorFk: event.instructorFk,
        instructorDiscipline: event.discipline1Fk,
      );
      emit(state);
    });
  }

  final ListEdcensoDisciplineUsecase _edcensoDisciplinesUseCase;
  final ListInstructorsUsecase _instructorsUseCase;
  final CreateInstructorTeachingDataUseCase
      _createInstructorTeachingDataUseCase;
  final UpdateInstructorTeachingDataUseCase
      _updateInstructorTeachingDataUseCase;

  Future<void> fetchInstructorsAndDisciplines({
    int? instructorFk,
    int? instructorDiscipline,
  }) async {
    final requests = await Future.wait([
      _instructorsUseCase(
        EmptyParams(),
      ),
      _edcensoDisciplinesUseCase(
        EmptyParams(),
      ),
    ]);

    List<Instructor> instructors = [];
    List<EdcensoDiscipline> disciplines = [];

    requests.first.fold(
      (error) => add(
        InstructorFormEventInsertError(),
      ),
      (instructorsResponse) =>
          instructors = instructorsResponse as List<Instructor>,
    );

    requests.last.fold(
      (error) => add(
        InstructorFormEventInsertError(),
      ),
      (disciplinesResponse) =>
          disciplines = disciplinesResponse as List<EdcensoDiscipline>,
    );

    if (instructors.isNotEmpty && disciplines.isNotEmpty) {
      currentInstructor = instructorFk ?? instructors.first.id ?? 1;
      changeCurrentDiscipline = instructorDiscipline ?? disciplines.first.id;
      add(
        InstructorFormEventSuccess(
          instructors: instructors,
          disciplines: disciplines,
        ),
      );
    } else {
      add(
        InstructorFormEventInsertError(),
      );
    }
  }

  late int? _currentInstructor;
  set currentInstructor(int selectedInstructorId) =>
      _currentInstructor = selectedInstructorId;
  int get currentInstructor => _currentInstructor!;

  late int? _currentDiscipline;
  set changeCurrentDiscipline(int selectedDisciplineId) =>
      _currentDiscipline = selectedDisciplineId;
  int get changeCurrentDiscipline => _currentDiscipline!;
  List<int> selectedDisciplines = [];

  late int? _classroomId;
  set classroomId(int classroomId) => _classroomId = classroomId;
  int get classroomId => _classroomId!;

  int _role = 1;
  void changeRole(int? role) => _role = role! + 1;
  int get currentRole => _role - 1;

  int _contractType = 1;
  void changeContractType(int contractType) => _contractType = contractType + 1;
  int get currentContractType => _contractType - 1;

  int? getIdDiscipline(List<int> disciplinesList, int index) {
    try {
      return disciplinesList.elementAt(index);
    } catch (e) {
      return null;
    }
  }
}
