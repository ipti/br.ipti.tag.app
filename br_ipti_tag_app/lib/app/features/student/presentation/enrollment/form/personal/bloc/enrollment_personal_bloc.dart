import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/color_race_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/filliation_type_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/nationality_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/scholarity_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/enums/sex_enum.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_student_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_bloc.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_personal_states.dart';

class EnrollmentPersonalBloc extends Cubit<EnrollmentPersonalState> {
  EnrollmentPersonalBloc(this._createStudentsUsecase)
      : super(const EmptyEnrollmentPersonalState());

  final CreateStudentsUsecase _createStudentsUsecase;

  final _session = Modular.get<SessionBloc>();
  final _enrollmentBloc = Modular.get<EnrollmentBloc>();

  final sexItems = Map.fromEntries(
    Sex.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  final colorRaceItems = Map.fromEntries(
    ColorRace.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  final scholatiryItems = Map.fromEntries(
    Scholarity.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  final filiationItems = Map.fromEntries(
    FilliationType.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  final nationalityItems = Map.fromEntries(
    Nationality.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  Future loadStudent(Student student) async {
    emit(state.copyWith(
      name: student.name,
      birthday: student.birthday,
      sex: student.sex,
      colorRace: student.colorRace,
      filiation: student.filiation,
      nationality: student.nationality,
      deficiency: student.deficiency,
      foodRestrictions: student.foodRestrictions,
    ));
  }

  void setName(String value) => emit(state.copyWith(
        name: value,
      ));
  void setBirthday(String value) => emit(state.copyWith(birthday: value));
  void setSex(int value) => emit(state.copyWith(sex: value));
  void setColorRace(int value) => emit(state.copyWith(colorRace: value));
  void setFiliation(int value) => emit(state.copyWith(filiation: value));
  void setNationality(int value) => emit(state.copyWith(nationality: value));
  void setDeficiency({bool value = false}) => emit(state.copyWith(
        deficiency: value,
      ));
  void setFoodRestriction(String value) => emit(
        state.copyWith(foodRestrictions: value),
      );

  Future<void> submitPersonalForm() async {
    final school = _session.state.currentSchool!;
    final year = await _session.getYear();

    final student = Student(
      name: state.name,
      birthday: state.birthday,
      sex: state.sex,
      colorRace: state.colorRace,
      nationality: state.nationality,
      // deficiency: state.deficiency,
      foodRestrictions: state.foodRestrictions,
      filiation: state.filiation,
      registerType: "rg",
      sendYear: int.parse(year),
      edcensoUfFk: school.edcensoUfFk,
      edcensoCityFk: school.edcensoCityFk,
      edcensoDistrictFk: school.edcensoDistrictFk,
      edcensoNationFk: "61ee3e877652254244a8b224",
      schoolInepIdFk: school.id,
    );

    final result = await _createStudentsUsecase.call(
      CreateStudentParams(
        student: student,
      ),
    );

    result.fold(id, (student) {
      _enrollmentBloc.setStudent(student);
      _enrollmentBloc.nextTab();
    });
  }
}
