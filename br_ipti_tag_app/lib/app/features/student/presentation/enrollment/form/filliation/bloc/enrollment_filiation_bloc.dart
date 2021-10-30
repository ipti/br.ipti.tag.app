import 'package:flutter_bloc/flutter_bloc.dart';

import 'enrollment_filiation_states.dart';

class EnrollmentFiliationBloc extends Cubit<EnrollmentFiliationState> {
  EnrollmentFiliationBloc() : super(const EmptyEnrollmentFiliationState());

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

  final residenceZoneItems = <int, String>{
    1: "URBANA",
    2: "RURAL",
  };

  final classesItems = <int, String>{
    1: "Turma 1",
    2: "Turma 2",
  };

  // Filiação
  void setNameFiliation(String value) => emit(state.copyWith(
        name: value,
      ));

  void setCpfFiliation(String value) => emit(state.copyWith(
        cpf: value,
      ));

  void setRgFiliation(String value) => emit(state.copyWith(
        rg: value,
      ));

  void setNationalityFiliation(int value) => emit(
        state.copyWith(nationality: value),
      );

  void setColorRaceFiliation(int value) => emit(state.copyWith(
        colorRace: value,
      ));

  void setScholarityFiliation(int value) => emit(state.copyWith(
        scholarity: value,
      ));

  void setJobFiliation(String value) => emit(state.copyWith(
        job: value,
      ));

  void setEmailFiliation(String value) => emit(state.copyWith(
        email: value,
      ));

  void setPhoneFiliation(String value) => emit(state.copyWith(
        phone: value,
      ));
}
