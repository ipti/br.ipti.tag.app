import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_student_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_personal_states.dart';

class EnrollmentPersonalBloc extends Cubit<EnrollmentPersonalState> {
  EnrollmentPersonalBloc(
    this._createStudentsUsecase,
  ) : super(const EmptyEnrollmentPersonalState());

  final CreateStudentsUsecase _createStudentsUsecase;

  final sexItems = <int, String>{0: "Masculino", 1: "Feminino"};

  final colorRaceItems = <int, String>{
    0: "Não declarada",
    1: "Branca",
    2: "Preta",
    3: "Parda",
    4: "Amarela",
    5: "Indígena",
  };

  final scholatiryItems = <int, String>{
    0: "Não sabe ler e escrever",
    1: "Sabe ler e escrever",
    2: "Ens. Fund. Incompleto",
    3: "Ens. Fund. Completo",
    4: "Ens. Med. Incompleto",
    5: "Ens. Med. Completo",
    6: "Ens. Sup. Incompleto",
    7: "Ens. Sup. Completo",
  };

  final filiationItems = <int, String>{
    0: "Não declarado/Ignorado",
    1: "Pai e/ou Mãe",
  };

  final nationalityItems = <int, String>{
    0: "Brasileira",
    1: "Brasileira: Nascido no exterior ou Naturalizado",
    2: "Estrangeira"
  };

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
    final EnrollmentBloc _enrollmentBloc = Modular.get();

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
      sendYear: 2020,
      edcensoUfFk: "61a92b6dd2b8a11704d7ae6a",
      edcensoCityFk: "61a92c8ed2b8a11704d813fe",
      edcensoDistrictFk: "61a93a0781524118745b6314",
    );

    final result = await _createStudentsUsecase.call(
      CreateStudentParams(
        student: student,
      ),
    );

    result.fold((l) => print(l), (r) => _enrollmentBloc.setStudent(r.id));
  }
}
