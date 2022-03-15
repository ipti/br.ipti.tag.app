import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/change_filiation_student_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/student_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_filiation_states.dart';

class EnrollmentFiliationBloc extends Cubit<EnrollmentFiliationState> {
  EnrollmentFiliationBloc(
    this._changeFiliationStudentUsecase,
  ) : super(const EmptyEnrollmentFiliationState());

  final ChangeFiliationStudentUsecase _changeFiliationStudentUsecase;

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
    0: "Brasileira",
    1: "Brasileira: Nascido no exterior ou Naturalizado",
    2: "Estrangeira"
  };

  final residenceZoneItems = <int, String>{
    1: "URBANA",
    2: "RURAL",
  };

  Future loadStudent(Student student) async {
    emit(state.copyWith(
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
    ));
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

  void setScholarityResponsable(int value) => emit(
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

  void setScholarityFiliation1(int value) => emit(
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

  void setScholarityFiliation2(int value) => emit(
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
    await Modular.isModuleReady<StudentModule>();
    final _enrollmentBloc = Modular.get<EnrollmentBloc>();

    final student = _enrollmentBloc.state.student;

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

    final params = ChangeFiliationStudentParams(
      student: studentFiliation,
    );

    await _changeFiliationStudentUsecase(params);

    _enrollmentBloc.setStudent(studentFiliation);
    _enrollmentBloc.nextTab();
  }
}
