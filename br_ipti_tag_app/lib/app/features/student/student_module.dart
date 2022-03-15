import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/enrollment_module.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/fast_enrollment/pages/_classes_form_partial_page.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/fast_enrollment/pages/_personal_form_partial_page.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/list/bloc/student_list_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/list/student_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/remote/student_remote_datasource.dart';
import 'data/repositories/student_repository_impl.dart';
import 'domain/usecases/fast_enrollment_usecase.dart';
import 'domain/usecases/list_student_usecase.dart';
import 'presentation/fast_enrollment/bloc/fast_enrollment_bloc.dart';
import 'presentation/fast_enrollment/pages/enrollment_page.dart';

class StudentModule extends Module {
  @override
  final List<Bind> binds = [
    // datasources
    Bind.factory((i) => StudentRemoteDataSource(i.get())),

    // repositories
    Bind.factory((i) => StudentRepositoryImpl(i.get())),

    // usecases
    Bind.factory((i) => FastEnrollmentUsecase(i.get())),
    Bind.factory((i) => ListStudentsUsecase(i.get())),

    // list
    Bind.factory((i) => StudentListBloc(i.get())),

    //enrollment
    // Bind.singleton((i) => EnrollmentBloc()),
    Bind.singleton((i) => FastEnrollmentBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => const StudentPage()),
    ModuleRoute(
      "/matricula",
      module: EnrollmentModule(),
    ),
    ChildRoute(
      "/matricula-rapida",
      child: (_, args) => const FastEnrollmentPage(),
      children: [
        ChildRoute(
          '/personal',
          child: (_, args) => const PersonalDataFormPage(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/classes',
          child: (_, args) => const ClassesFormPage(),
          transition: TransitionType.rightToLeft,
        ),
      ],
    ),
  ];
}
