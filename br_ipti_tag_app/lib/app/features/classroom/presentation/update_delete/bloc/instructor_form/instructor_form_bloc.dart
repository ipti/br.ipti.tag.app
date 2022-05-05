import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/check_discipline_id.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructor_teaching_data_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/update_instructor_teaching_data_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/create_instructor_teaching_data_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_edcenso_disciplines_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/update_instructor_teaching_data_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_events.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final initialState = InstructorFormStateLoading();

class InstructorFormBloc
    extends Bloc<InstructorFormEvent, InstructorFormState> {
  InstructorFormBloc(
      this._instructorsUseCase,
      this._edcensoDisciplinesUseCase,
      this._createInstructorTeachingDataUseCase,
      this._updateInstructorTeachingDataUseCase)
      : super(initialState);
  final ListEdcensoDisciplinesUseCase _edcensoDisciplinesUseCase;
  final ListInstructorsUseCase _instructorsUseCase;
  final CreateInstructorTeachingDataUseCase
      _createInstructorTeachingDataUseCase;
  final UpdateInstructorTeachingDataUseCase
      _updateInstructorTeachingDataUseCase;

  Future<void> fetchInstructorsAndDisciplines(
      {String? instructorFk, String? instructorDiscipline}) async {
    final requests = await Future.wait([
      _instructorsUseCase(NoParams()),
      _edcensoDisciplinesUseCase(NoParams())
    ]);

    List<InstructorEntity> instructors = [];
    List<EdcensoDisciplinesEntity> disciplines = [];

    requests.first.fold(
        (error) => emit(InstructorFormStateError()),
        (instructorsResponse) =>
            instructors = instructorsResponse as List<InstructorEntity>);

    requests.last.fold(
        (error) => emit(InstructorFormStateError()),
        (disciplinesResponse) => disciplines =
            disciplinesResponse as List<EdcensoDisciplinesEntity>);

    if (instructors.isNotEmpty && disciplines.isNotEmpty) {
      changeCurrentInstructor(instructorFk ?? instructors.first.id);
      changeCurrentDiscipline(instructorDiscipline ?? disciplines.first.id);
      emit(InstructorFormStateSuccess(
          instructors: instructors, disciplines: disciplines));
    } else {
      emit(InstructorFormStateError());
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
  List<String> selectedDisciplines = [];

  String? _classroomId;
  void setClassroomId(String classroomId) => _classroomId = classroomId;

  int _role = 1;
  void changeRole(int role) => _role = role + 1;
  int get currentRole => _role - 1;

  int _contractType = 1;
  void changeContractType(int contractType) => _contractType = contractType + 1;
  int get currentContractType => _contractType - 1;

  @override
  Stream<InstructorFormState> mapEventToState(
      InstructorFormEvent event) async* {
    InstructorFormState newState = state;
    if (event is SubmitInstructorForm) {
      final params = InstructorTeachingDataCreateEntity(
          schoolInepIdFk: '61a9433412656f31249d2aa2',
          instructorFk: _currentInstructor!,
          classroomIdFk: _classroomId!,
          discipline1Fk: selectedDisciplines[0],
          discipline2Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 1),
          discipline3Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 2),
          discipline4Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 3),
          discipline5Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 4),
          discipline6Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 5),
          discipline7Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 6),
          discipline8Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 7),
          discipline9Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 8),
          discipline10Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 9),
          discipline11Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 10),
          discipline12Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 11),
          discipline13Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 12),
          discipline14Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 13),
          discipline15Fk:
              CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 14),
          role: _role,
          contractType: _contractType);
      final createInstructorRequestResponse =
          await _createInstructorTeachingDataUseCase(params);
      createInstructorRequestResponse.fold(
          (error) => emit(InstructorFormStateError()),
          (success) => emit(InstructorFormStateInsertSuccess()));
      newState = state;
    }
    if (event is SubmitUpdateInstructorForm) {
      final params = UpdateInstructorTeachingDataParams(
          event.instructorTeachingDataId,
          InstructorTeachingDataUpdateEntity(
            role: _role,
            contract_type: _contractType,
            discipline1Fk: selectedDisciplines[0],
            discipline2Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 1),
            discipline3Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 2),
            discipline4Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 3),
            discipline5Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 4),
            discipline6Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 5),
            discipline7Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 6),
            discipline8Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 7),
            discipline9Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 8),
            discipline10Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 9),
            discipline11Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 10),
            discipline12Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 11),
            discipline13Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 12),
            discipline14Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 13),
            discipline15Fk:
                CheckIdDiscipline.getIdDiscipline(selectedDisciplines, 14),
          ));
      final instructorRequestResposne =
          await _updateInstructorTeachingDataUseCase(params);
    }
    if (event is LoadInstructorForm) {
      await fetchInstructorsAndDisciplines();
      newState = state;
      selectedDisciplines = [];
    }
    if (event is UpdateInstructorForm) {
      await fetchInstructorsAndDisciplines(
          instructorFk: event.instructorFk,
          instructorDiscipline: event.discipline1Fk);
      newState = state;
    }
    yield newState;
  }
}
