import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_cities_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_ufs_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_address_states.dart';

class EnrollmentAddressBloc extends Cubit<EnrollmentAddressState> {
  EnrollmentAddressBloc(
    this._listCitiesUsecase,
    this._listUFsUsecase,
  ) : super(const EmptyEnrollmentAddressState());

  final ListCitiesUsecase _listCitiesUsecase;
  final ListUFsUsecase _listUFsUsecase;

  void setCEP(String cep) => emit(state.copyWith(cep: cep));
  void setAddress(String address) => emit(state.copyWith(address: address));
  void setComplement(String complement) => emit(
        state.copyWith(complement: complement),
      );
  void setCity(String city) => emit(state.copyWith(edcensoCityFk: city));

  void setNeighborhood(String neighborhood) => emit(
        state.copyWith(neighborhood: neighborhood),
      );
  void setNumber(String number) => emit(state.copyWith(number: number));
  void setZone(int residenceZone) =>
      emit(state.copyWith(residenceZone: residenceZone));

  void setUf(String uf) {
    fetchCities(uf);
    emit(state.copyWith(edcensoUfFk: uf));
  }

  Future fetchCities([String? uf]) async {
    final result = await _listCitiesUsecase(FilterUFParams(uf: uf));
    result.fold(id, (cities) {
      final mappedValues = <String, String>{};
      mappedValues.addEntries(cities.map((e) => MapEntry<String, String>(
            e.id ?? "",
            e.name ?? "",
          )));
      emit(state.copyWith(
          cities: mappedValues, edcensoCityFk: mappedValues.entries.first.key));
    });
  }

  Future submitAddressForm() async {
    final EnrollmentBloc _enrollmentBloc = Modular.get();
    _enrollmentBloc.nextTab();
  }

  Future fetchUFs() async {
    if (state.ufs.isEmpty) {
      final result = await _listUFsUsecase(NoParams());
      result.fold(id, (ufs) {
        final mappedValues = <String, String>{};
        mappedValues.addEntries(ufs.map((e) => MapEntry<String, String>(
              e.id ?? "",
              e.acronym ?? "",
            )));
        fetchCities(mappedValues.entries.first.key);
        emit(state.copyWith(
            ufs: mappedValues, edcensoUfFk: mappedValues.entries.first.key));
      });
    }
  }
}
