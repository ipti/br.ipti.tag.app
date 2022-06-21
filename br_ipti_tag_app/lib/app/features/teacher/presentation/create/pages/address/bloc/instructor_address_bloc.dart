import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_cities_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_ufs_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_documents_and_address.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/update_address_documents_usecase.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/instructor.dart';
import 'package:br_ipti_tag_app/app/features/teacher/presentation/create/bloc/create_instructor_bloc.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'instructor_address_states.dart';

class InstructorAddressBloc extends Cubit<InstructorAddressState> {
  InstructorAddressBloc(
    this._listCitiesUsecase,
    this._listUFsUsecase,
  ) : super(const EmptyInstructorAddressState());

  final _createInstructorBloc = Modular.get<CreateInstructorBloc>();

  final ListCitiesUsecase _listCitiesUsecase;
  final ListUFsUsecase _listUFsUsecase;

  final _session = Modular.get<SessionBloc>();
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

  void setUf(String uf) {
    fetchCities(uf);
    emit(state.copyWith(edcensoUfFk: uf));
  }

  Future fetchCities([String? uf]) async {
    final result = await _listCitiesUsecase(FilterUFParams(uf: uf));
    result.fold(id, (cities) {
      final mappedValues = {for (var city in cities) city.id: city.name};

      final loadCitiesState = state.copyWith(
        cities: mappedValues,
        edcensoCityFk: mappedValues.entries.first.key,
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

  Future loadInstructorAddress(Instructor studentDocuments) async {
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

  Future submitAddressForm(EditMode mode) async {
    switch (mode) {
      case EditMode.Create:
        _create();
        break;
      case EditMode.Edit:
        await _edit();
        break;
      default:
    }
  }

  Future _create() async {
    _createInstructorBloc.loadAddressData(address: state);
  }

  Future _edit() async {}
}
