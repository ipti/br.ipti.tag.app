import 'package:br_ipti_tag_app/app/core/util/enums/edit_mode.dart';
import 'package:br_ipti_tag_app/app/core/util/session/session_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/enrollment/bloc/enrollment_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'enrollment_social_states.dart';

class EnrollmentSocialBloc extends Cubit<EnrollmentSocialState> {
  EnrollmentSocialBloc(
    this._addressToStudentUsecase,
    this._updateDocumentsAndAddressUsecase,
  ) : super(
          const EmptyEnrollmentSocialState(),
        );

  final _session = Modular.get<SessionBloc>();
  final _enrollmentBloc = Modular.get<EnrollmentBloc>();

  final AddDocumentsAndAddressToStudentUsecase _addressToStudentUsecase;
  final UpdateDocumentsAndAddressUsecase _updateDocumentsAndAddressUsecase;

  // Social
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

  void setBfParticipator({bool value = false}) => emit(
        state.copyWith(
          bfParticipator: value,
        ),
      );

  Future loadStudentDocsAddress(StudentDocsAddress studentDocuments) async {
    emit(
      state.copyWith(
        nis: studentDocuments.nis,
        inepId: _session.state.currentSchool?.inepId ?? '',
      ),
    );
  }

  Future<void> submitSocialForm(EditMode mode) async {
    final oldStudentDocumentsAddress = _enrollmentBloc.studentDocs!;
    final newStudentDocumentsAddress = oldStudentDocumentsAddress.copyWith(
      nis: state.nis,
    );
    switch (mode) {
      case EditMode.Create:
        await _create(newStudentDocumentsAddress);
        break;
      case EditMode.Edit:
        await _edit(newStudentDocumentsAddress);
        break;
      default:
    }
  }

  Future _create(StudentDocsAddress studentDocuments) async {
    final params = AddDocumentsAndAddressToStudentParams(
      studentDocumentsAddress: studentDocuments,
    );

    final result = await _addressToStudentUsecase(params);
    result.fold(id, (studentDocs) {
      _enrollmentBloc.loadStudentDocs(studentDocs);
      _enrollmentBloc.nextTab();
    });
  }

  Future _edit(StudentDocsAddress studentDocuments) async {
    final params = UpdateDocumentsAndAddressParams(
      studentDocsId: studentDocuments.id!,
      studentDocumentsAndAddress: studentDocuments,
    );

    final result = await _updateDocumentsAndAddressUsecase(params);
    result.fold(id, (studentDocs) {
      _enrollmentBloc.loadStudentDocs(studentDocs);
      _enrollmentBloc.nextTab();
    });
  }
}
