import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'enrollment_filiation_states.dart';

class EnrollmentFiliationBloc extends Cubit<EnrollmentFiliationState> {
  EnrollmentFiliationBloc(
    this._changeFiliationStudentUsecase,
  ) : super(
          const EmptyEnrollmentFiliationState(),
        );

  final UpdateStudentUsecase _changeFiliationStudentUsecase;

  final scholarityItems = Map.fromEntries(
    Scholarity.values.map(
      (e) => MapEntry(e.id, e.name),
    ),
  );

  Future loadStudent(Student student) async {
    emit(
      state.copyWith(
        nameFiliation1: student.filiation1,
        cpfFiliation1: student.filiation1Cpf,
        rgFiliation1: student.filiation1Rg,
        jobFiliation1: student.filiation1Job,
        scholarityFiliation1: student.filiation1Scholarity,
        nameFiliation2: student.filiation2,
        cpfFiliation2: student.filiation2Cpf,
        rgFiliation2: student.filiation2Rg,
        jobFiliation2: student.filiation2Job,
        scholarityFiliation2: student.filiation2Scholarity,
        nameResponsable: student.responsableName,
        cpfResponsable: student.responsableCpf,
        rgResponsable: student.responsableRg,
        jobResponsable: student.responsableJob,
        scholarityResponsable: student.responsableScholarity,
      ),
    );
  }

  // Responsable
  void setNameResponsable(String value) => emit(
        state.copyWith(
          nameResponsable: value,
        ),
      );

  void setCpfResponsable(String value) => emit(
        state.copyWith(
          cpfResponsable: value,
        ),
      );

  void setRgResponsable(String value) => emit(
        state.copyWith(
          rgResponsable: value,
        ),
      );

  void setScholarityResponsable(int? value) => emit(
        state.copyWith(
          scholarityResponsable: value,
        ),
      );

  void setJobResponsable(String value) => emit(
        state.copyWith(
          jobResponsable: value,
        ),
      );

  // Filiation 1
  void setNameFiliation1(String value) => emit(
        state.copyWith(
          nameFiliation1: value,
        ),
      );

  void setCpfFiliation1(String value) => emit(
        state.copyWith(
          cpfFiliation1: value,
        ),
      );

  void setRgFiliation1(String value) => emit(
        state.copyWith(
          rgFiliation1: value,
        ),
      );

  void setScholarityFiliation1(int? value) => emit(
        state.copyWith(
          scholarityFiliation1: value,
        ),
      );

  void setJobFiliation1(String value) => emit(
        state.copyWith(
          jobFiliation1: value,
        ),
      );

  // Filiation 2
  void setNameFiliation2(String value) => emit(
        state.copyWith(
          nameFiliation2: value,
        ),
      );

  void setCpfFiliation2(String value) => emit(
        state.copyWith(
          cpfFiliation2: value,
        ),
      );

  void setRgFiliation2(String value) => emit(
        state.copyWith(
          rgFiliation2: value,
        ),
      );

  void setScholarityFiliation2(int? value) => emit(
        state.copyWith(
          scholarityFiliation2: value,
        ),
      );

  void setJobFiliation2(String value) => emit(
        state.copyWith(
          jobFiliation2: value,
        ),
      );

  Future<void> submitFiliationForm() async {
    final _enrollmentBloc = Modular.get<EnrollmentBloc>();

    final student = _enrollmentBloc.student;

    final studentFiliation = student!.copyWith(
      filiation1: state.nameFiliation1,
      filiation1Rg: state.rgFiliation1,
      filiation1Cpf: state.cpfFiliation1,
      filiation1Job: state.jobFiliation1,
      filiation1Scholarity: state.scholarityFiliation1,
      filiation2: state.nameFiliation2,
      filiation2Rg: state.rgFiliation2,
      filiation2Cpf: state.cpfFiliation2,
      filiation2Job: state.jobFiliation2,
      filiation2Scholarity: state.scholarityFiliation2,
      responsableName: state.nameResponsable,
      responsableRg: state.rgResponsable,
      responsableCpf: state.cpfResponsable,
      responsableJob: state.jobResponsable,
      responsableScholarity: state.scholarityResponsable,
    );

    final params = UpdateStudentParams(
      id: studentFiliation.id!,
      student: studentFiliation,
    );

    final result = await _changeFiliationStudentUsecase(params);

    result.fold(
      (error) => _enrollmentBloc.notifyError(
        error.toString(),
      ),
      (studentFiliation) {
        _enrollmentBloc.loadStudent(studentFiliation);
        _enrollmentBloc.notifySuccess(
          "Dados de filiação do aluno atualizadas com sucesso",
        );
        _enrollmentBloc.nextTab();
      },
    );
  }
}
