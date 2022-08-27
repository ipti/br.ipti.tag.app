import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_cities_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_ufs_usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/bloc/create_instructor_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../bloc/instructor_states.dart';
import 'instructor_address_states.dart';

class InstructorAddressBloc extends Cubit<InstructorAddressState> {
  InstructorAddressBloc(
    this._listCitiesUsecase,
    this._listUFsUsecase,
  ) : super(const EmptyInstructorAddressState());

  final _createInstructorBloc = Modular.get<CreateInstructorBloc>();

  final ListCitiesUsecase _listCitiesUsecase;
  final ListUFsUsecase _listUFsUsecase;

  void setCEP(String cep) => emit(state.copyWith(cep: cep.replaceAll('-', '')));
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

  Future<void> setUf(String uf) async {
    fetchCities(uf);
    emit(state.copyWith(edcensoUfFk: uf));
  }

  Future fetchCities([String? uf]) async {
    final result = await _listCitiesUsecase(FilterUFParams(uf: uf));
    result.fold(id, (cities) {
      final mappedValues = {for (var city in cities) city.id: city.name};

      final defaultKey = mappedValues.containsKey(state.edcensoCityFk)
          ? state.edcensoCityFk
          : mappedValues.entries.first.key;

      final loadCitiesState = state.copyWith(
        cities: mappedValues,
        edcensoCityFk: defaultKey,
      );

      emit(loadCitiesState);
    });
  }

  Future fetchUFs() async {
    if (state.ufs.isEmpty) {
      final result = await _listUFsUsecase(NoParams());
      result.fold(id, (ufs) async {
        final mappedValues = {for (var uf in ufs) uf.id: uf.acronym};

        final currentUf = state.edcensoUfFk;

        final loadUfState = state.copyWith(
          ufs: mappedValues,
          edcensoUfFk: currentUf,
        );

        emit(loadUfState);
        if (state.edcensoCityFk != null) fetchCities(currentUf);
      });
    }
  }

  Future loadInstructorAddress(InstructorFormState studentDocuments) async {
    final loadState = state.copyWith(
      cep: studentDocuments.cep,
      address: studentDocuments.address,
      neighborhood: studentDocuments.neighborhood,
      residenceZone: studentDocuments.areaOfResidence,
      number: studentDocuments.addressNumber,
      complement: studentDocuments.complement,
      edcensoUfFk: studentDocuments.edcensoUfFk,
      edcensoCityFk: studentDocuments.edcensoCityFk,
      nis: studentDocuments.nis,
    );

    emit(loadState);
  }

  Future submitAddressForm() async {
    _createInstructorBloc.loadAddressData(address: state);
    _createInstructorBloc.goToTab(2);
  }

  void autoUpdate() {
    stream.listen((event) {
      _createInstructorBloc.loadAddressData(address: event);
    });
  }
}
