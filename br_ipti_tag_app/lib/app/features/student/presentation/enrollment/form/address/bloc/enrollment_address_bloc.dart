import 'package:flutter_bloc/flutter_bloc.dart';

import 'enrollment_address_states.dart';

class EnrollmentAddressBloc extends Cubit<EnrollmentAddressState> {
  EnrollmentAddressBloc() : super(EnrollmentAddressState());

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
}
