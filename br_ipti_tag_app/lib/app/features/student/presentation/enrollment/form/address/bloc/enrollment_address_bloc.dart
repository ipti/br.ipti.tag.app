import 'package:flutter_bloc/flutter_bloc.dart';

import 'enrollment_address_states.dart';

class EnrollmentAddressBloc extends Cubit<EnrollmentAddressState> {
  EnrollmentAddressBloc() : super(const EmptyEnrollmentAddressState());

  void setCEP(String cep) => emit(state.copyWith(cep: cep));
  void setAddress(String address) => emit(state.copyWith(address: address));
  void setComplement(String complement) => emit(
        state.copyWith(complement: complement),
      );
  void setCity(String city) => emit(state.copyWith(edcensoCityFk: city));
  void setUf(String uf) => emit(state.copyWith(edcensoUfFk: uf));
  void setNeighborhood(String neighborhood) => emit(
        state.copyWith(neighborhood: neighborhood),
      );
  void setNumber(String number) => emit(state.copyWith(number: number));
  void setZone(int residenceZone) =>
      emit(state.copyWith(residenceZone: residenceZone));
}
