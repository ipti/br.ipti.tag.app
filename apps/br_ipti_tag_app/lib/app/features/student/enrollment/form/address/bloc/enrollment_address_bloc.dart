import 'package:br_ipti_tag_app/app/core/util/enums/enums.dart';
import 'package:br_ipti_tag_app/app/core/util/session/session_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/enrollment/bloc/enrollment_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'enrollment_address_states.dart';

class EnrollmentAddressBloc extends Cubit<EnrollmentAddressState> {
  EnrollmentAddressBloc(
    this._listCitiesUsecase,
    this._listUFsUsecase,
    this._updateDocumentsAndAddressUsecase,
    this._addAddressToStudentUsecase,
  ) : super(
          const EmptyEnrollmentAddressState(),
        );

  final ListCitiesUsecase _listCitiesUsecase;
  final ListUFsUsecase _listUFsUsecase;
  final AddDocumentsAndAddressToStudentUsecase _addAddressToStudentUsecase;
  final UpdateDocumentsAndAddressUsecase _updateDocumentsAndAddressUsecase;

  final _session = Modular.get<SessionBloc>();
  final _enrollmentBloc = Modular.get<EnrollmentBloc>();

  void setCEP(String cep) => emit(
        state.copyWith(
          cep: cep.replaceAll('-', ''),
        ),
      );
  void setAddress(String address) => emit(
        state.copyWith(address: address),
      );
  void setComplement(String complement) => emit(
        state.copyWith(complement: complement),
      );
  void setCity(int? city) => emit(
        state.copyWith(edcensoCityFk: city),
      );

  void setNeighborhood(String neighborhood) => emit(
        state.copyWith(neighborhood: neighborhood),
      );
  void setNumber(String number) => emit(
        state.copyWith(number: number),
      );
  void setZone(int residenceZone) => emit(
        state.copyWith(residenceZone: residenceZone),
      );

  void setUf(int? uf) {
    fetchCities(uf);
    emit(
      state.copyWith(edcensoUfFk: uf),
    );
  }

  void setNis(String value) => emit(
        state.copyWith(
          nis: value,
        ),
      );

  void setInepId(String value) => emit(
        state.copyWith(
          inepId: value,
        ),
      );

  Future fetchCities([int? uf]) async {
    final result = await _listCitiesUsecase(
      FilterUFParams(uf: uf),
    );
    result.fold(id, (cities) {
      final mappedValues = <int, String>{};
      mappedValues.addEntries(cities.map(
        (e) => MapEntry<int, String>(
          e.id,
          e.name,
        ),
      ));
      emit(
        state.copyWith(
          cities: mappedValues,
          edcensoCityFk: mappedValues.entries.first.key,
        ),
      );
    });
  }

  Future fetchUFs() async {
    if (state.ufs.isEmpty) {
      final result = await _listUFsUsecase(
        EmptyParams(),
      );
      result.fold(id, (ufs) async {
        final mappedValues = <int, String>{};
        mappedValues.addEntries(ufs.map(
          (e) => MapEntry<int, String>(
            e.id,
            e.acronym,
          ),
        ));

        final currentUf = state.edcensoUfFk ?? mappedValues.entries.first.key;

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

  Future loadStudentDocsAddress(StudentDocsAddress studentDocuments) async {
    emit(
      state.copyWith(
        docsAddress: studentDocuments,
        cep: studentDocuments.cep,
        address: studentDocuments.address,
        neighborhood: studentDocuments.neighborhood,
        residenceZone: studentDocuments.residenceZone,
        number: studentDocuments.number,
        complement: studentDocuments.complement,
        edcensoUfFk: studentDocuments.edcensoUfFk,
        edcensoCityFk: studentDocuments.edcensoCityFk,
        nis: studentDocuments.nis,
      ),
    );
  }

  Future submitAddressForm(EditMode mode) async {
    switch (mode) {
      case EditMode.Create:
        final studentDocuments = _buildStudentDocsAddress();
        _create(studentDocuments);
        break;
      case EditMode.Edit:
        await _edit(state.docsAddress!);
        break;
      default:
    }
  }

  Future _create(StudentDocsAddress studentDocuments) async {
    final params = AddDocumentsAndAddressToStudentParams(
      studentDocumentsAddress: studentDocuments,
    );

    final result = await _addAddressToStudentUsecase(params);
    result.fold(
      (error) => _enrollmentBloc.notifyError(
        error.toString(),
      ),
      (studentDocs) {
        _enrollmentBloc.loadStudentDocs(studentDocs);
        _enrollmentBloc.notifySuccess(
          "Documentos e endereço do aluno cadastrados com sucesso",
        );
        _enrollmentBloc.nextTab();
      },
    );
  }

  Future _edit(StudentDocsAddress studentDocuments) async {
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
      (error) => _enrollmentBloc.notifyError(
        error.toString(),
      ),
      (docsAddress) {
        _enrollmentBloc.loadStudentDocs(docsAddress);
        _enrollmentBloc.notifySuccess(
          "Documentos e endereço do aluno atualizadas com sucesso",
        );
        _enrollmentBloc.nextTab();
      },
    );
  }

  StudentDocsAddress _buildStudentDocsAddress() {
    final student = _enrollmentBloc.student!;
    final school = _session.state.currentSchool!;

    return StudentDocsAddress(
      nis: state.nis,
      schoolInepIdFk: school.id!,
      studentFk: student.id!,
      rgNumber: '354511254',
      edcensoUfFk: state.edcensoUfFk!,
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
