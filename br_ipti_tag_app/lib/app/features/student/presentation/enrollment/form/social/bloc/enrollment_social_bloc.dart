import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_documents_and_address.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/form/address/bloc/enrollment_address_bloc.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_social_states.dart';

class EnrollmentSocialBloc extends Cubit<EnrollmentSocialState> {
  EnrollmentSocialBloc(this._addressToStudentUsecase)
      : super(
          const EmptyEnrollmentSocialState(),
        );

  final _session = Modular.get<SessionBloc>();
  final _enrollmentBloc = Modular.get<EnrollmentBloc>();
  final _addressBloc = Modular.get<EnrollmentAddressBloc>();

  final AddDocumentsAndAddressToStudentUsecase _addressToStudentUsecase;

  // Social
  void setNis(String value) => emit(state.copyWith(
        nis: value,
      ));

  void setInepId(String value) => emit(state.copyWith(
        inepId: value,
      ));

  void setBfParticipator({bool value = false}) => emit(state.copyWith(
        bfParticipator: value,
      ));

  Future<void> submitSocialForm() async {
    final addressState = _addressBloc.state;
    final params = AddDocumentsAndAddressToStudentParams(
      nis: state.nis,
      address: addressState.address,
      cep: addressState.cep,
      complement: addressState.complement,
      neighborhood: addressState.neighborhood,
      edcensoCityFk: addressState.edcensoCityFk!,
      studentFk: _enrollmentBloc.state.studentId,
      rgNumber: "12314321",
      residenceZone: 1,
      edcensoUfFk: addressState.edcensoUfFk,
      schoolInepIdFk: _session.state.currentSchool!.id!,
    );
    await _addressToStudentUsecase(params);
  }
}
