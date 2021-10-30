import 'package:br_ipti_tag_app/app/features/student/domain/usecases/fast_enrollment_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_states.dart';

class EnrollmentBloc extends Cubit<EnrollmentState> {
  EnrollmentBloc(this._enrollmentUsecase) : super(EnrollmentState());

  // ignore: unused_field
  final FastEnrollmentUsecase _enrollmentUsecase;

  Future<void> submitPersonalForm() async {
    // final result = await _enrollmentUsecase(EnrollmentParams(student));
    // result.fold((l) => null, (r) => emit(state));
  }

  void tabNavigation(int index) {
    switch (index) {
      case 0:
        Modular.to.navigate('/alunos/matricula/pessoal');
        break;
      case 1:
        Modular.to.navigate('/alunos/matricula/filiacao');
        break;
      case 2:
        Modular.to.navigate('/alunos/matricula/endereco');
        break;
      case 3:
        Modular.to.navigate('/alunos/matricula/social');
        break;
      case 4:
        Modular.to.navigate('/alunos/matricula/turma');
        break;
      default:
    }
  }
}
