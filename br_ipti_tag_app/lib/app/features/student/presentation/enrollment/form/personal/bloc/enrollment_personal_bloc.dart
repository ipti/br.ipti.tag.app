import 'package:br_ipti_tag_app/app/features/student/domain/usecases/fast_enrollment_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'enrollment_personal_states.dart';

class EnrollmentPersonalBloc extends Cubit<EnrollmentPersonalState> {
  EnrollmentPersonalBloc() : super(const EmptyEnrollmentPersonalState());

  final sexItems = <int, String>{1: "Masculino", 2: "Feminino"};

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
    1: "Brasileira",
    2: "Brasileira: Nascido no exterior ou Naturalizado",
    3: "Estrangeira"
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

  void setFoodRestriction(String value) => emit(state.copyWith(
        foodRestrictions: value,
      ));

  Future<void> submitPersonalForm() async {}
}
