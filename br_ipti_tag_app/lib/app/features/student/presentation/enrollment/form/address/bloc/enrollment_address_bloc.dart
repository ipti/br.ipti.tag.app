import 'package:br_ipti_tag_app/app/core/usecases/usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_cities_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_ufs_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/update_address_documents_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_bloc.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_address_states.dart';

class EnrollmentAddressBloc extends Cubit<EnrollmentAddressState> {
  EnrollmentAddressBloc(
    this._listCitiesUsecase,
    this._listUFsUsecase,
    this._updateDocumentsAndAddressUsecase,
  ) : super(const EmptyEnrollmentAddressState());

  final ListCitiesUsecase _listCitiesUsecase;
  final ListUFsUsecase _listUFsUsecase;
  final UpdateDocumentsAndAddressUsecase _updateDocumentsAndAddressUsecase;

  final EnrollmentBloc _enrollmentBloc = Modular.get();

  void setCEP(String cep) => emit(
        state.copyWith(
          cep: cep.replaceAll('-', ''),
        ),
      );
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
        cities: mappedValues,
        edcensoCityFk:
            state.edcensoCityFk == null || state.edcensoCityFk!.isEmpty
                ? mappedValues.entries.first.key
                : state.edcensoCityFk,
      ));
    });
  }

  Future fetchUFs() async {
    if (state.ufs.isEmpty) {
      final result = await _listUFsUsecase(NoParams());
      result.fold(id, (ufs) async {
        final mappedValues = <String, String>{};
        mappedValues.addEntries(ufs.map((e) => MapEntry<String, String>(
              e.id ?? "",
              e.acronym ?? "",
            )));

        final currentUf = state.edcensoUfFk.isEmpty
            ? mappedValues.entries.first.key
            : state.edcensoUfFk;

        await fetchCities(currentUf);
        emit(
          state.copyWith(
            ufs: mappedValues,
            edcensoUfFk: currentUf,
          ),
        );
      });
    }
  }

  Future loadStudentDocuments(StudentDocuments studentDocuments) async {
    emit(state.copyWith(
      cep: studentDocuments.cep,
      address: studentDocuments.address,
      neighborhood: studentDocuments.neighborhood,
      residenceZone: studentDocuments.residenceZone,
      number: studentDocuments.number,
      complement: studentDocuments.complement,
      edcensoUfFk: studentDocuments.edcensoUfFk,
      edcensoCityFk: studentDocuments.edcensoCityFk,
    ));
  }

  Future submitAddressForm(EditMode mode) async {
    switch (mode) {
      case EditMode.Create:
        _create();
        break;
      case EditMode.Edit:
        final oldStudentDocs = _enrollmentBloc.state.studentDocs;
        if (oldStudentDocs?.id == null) {
          _create();
          break;
        } else {
          await _edit(oldStudentDocs!);
        }
        break;
      default:
    }
  }

  void _create() {
    final studentDocuments = _buildStudentDocuments();
    _enrollmentBloc.setStudentDocs(studentDocuments);
    _enrollmentBloc.nextTab();
  }

  Future _edit(StudentDocuments studentDocuments) async {
    final newStudentDocs = studentDocuments.copyWith(
      edcensoUfFk: state.edcensoUfFk,
      edcensoCityFk: state.edcensoCityFk,
      cep: state.cep,
      address: state.address,
      neighborhood: state.neighborhood,
      number: state.number,
      residenceZone: state.residenceZone,
      complement: state.complement,
    );

    final params = UpdateDocumentsAndAddressParams(
      studentDocsId: newStudentDocs.id!,
      studentDocumentsAndAddress: newStudentDocs,
    );
    final result = await _updateDocumentsAndAddressUsecase(params);
    result.fold(
      id,
      _enrollmentBloc.setStudentDocs,
    );
  }

  StudentDocuments _buildStudentDocuments() {
    return StudentDocuments(
      schoolInepIdFk: '',
      studentFk: '',
      rgNumber: '',
      edcensoUfFk: state.edcensoUfFk,
      edcensoCityFk: state.edcensoCityFk!,
      cep: state.cep,
      address: state.address,
      neighborhood: state.neighborhood,
      number: state.number,
      residenceZone: state.residenceZone,
      complement: state.complement,
    );
  }
}
