import 'package:br_ipti_tag_app/app/domain/data/repositories/student_repository.dart';
import 'package:br_ipti_tag_app/app/domain/domain/services/student_service.dart';
import 'package:br_ipti_tag_app/app/domain/domain/usecases/fast_enrollment_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/enrollment_bloc.dart';
import 'enrollment_page.dart';

class EnrollmentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => new EnrollmentBloc()),
    Bind.singleton((i) => new StudentRepository(i.get())),
    Bind.singleton((i) => new StudentService(i.get())),
    Bind.singleton((i) => new FastEnrollmentUsecase(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => EnrollmentPage())
  ];
}
