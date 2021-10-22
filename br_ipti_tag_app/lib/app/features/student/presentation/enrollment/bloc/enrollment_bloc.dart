import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/fast_enrollment_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_states.dart';

class EnrollmentBloc extends Cubit<EnrollmentState> {
  EnrollmentBloc(this._enrollmentUsecase) : super(const EnrollmentState());

  final FastEnrollmentUsecase _enrollmentUsecase;

  final sexItems = <int, String>{1: "Masculino", 2: "Feminino"};

  final colorRaceItems = <int, String>{
    0: "Não declarada",
    1: "Branca",
    2: "Preta",
    3: "Parda",
    4: "Amarela",
    5: "Indígena",
  };

  final filiationItems = <int, String>{
    0: "Não declarado/Ignorado",
    1: "Pai e/ou Mãe",
  };

  final nationalityItems = <int, String>{
    1: "Brasileira",
    2: "Brasileira: Nascido no exterior ou Naturalizado",
    3: "Estrangeira"
  };

  final residenceZoneItems = <int, String>{
    1: "URBANA",
    2: "RURAL",
  };

  final classesItems = <int, String>{
    1: "Turma 1",
    2: "Turma 2",
  };

  void setName(String value) => emit(state.copyWith(name: value));
  void setBirthday(String value) => emit(state.copyWith(birthday: value));
  void setSex(int value) => emit(state.copyWith(sex: value));
  void setColorRace(int value) => emit(state.copyWith(colorRace: value));
  void setFiliation(int value) => emit(state.copyWith(filiation: value));
  void setNationality(int value) => emit(state.copyWith(nationality: value));
  void setResidenceZone(int value) => emit(state.copyWith(
        residenceZone: value,
      ));
  void setDeficiency({required bool? value}) => emit(state.copyWith(
        deficiency: value,
      ));

  void setFoodRestriction(String value) => emit(state.copyWith(
        foodRestrictions: value,
      ));

  // Turma
  void setStudentClass(int value) => emit(state.copyWith(studentClass: value));

  Future<void> submitPersonalForm() async {
    final student = Student(
      name: state.name!,
      birthday: state.birthday,
      sex: state.sex,
      colorRace: state.colorRace,
      nationality: state.nationality,
      filiation: state.filiation,
      deficiency: state.deficiency ?? false,
      foodRestrictions: state.foodRestrictions,
    );

    final result = await _enrollmentUsecase(EnrollmentParams(student));
    result.fold((l) => null, (r) => emit(state));
  }

  void tabNavigation(int index) {
    switch (index) {
      case 0:
        Modular.to.navigate('/alunos/matricula-rapida/personal');
        break;
      case 1:
        Modular.to.navigate('/alunos/matricula-rapida/classes');
        break;
      default:
    }
  }
}
