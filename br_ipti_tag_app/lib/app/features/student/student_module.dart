import 'package:br_ipti_tag_app/app/features/student/mappers/student_api_to_entity.dart';
import 'package:br_ipti_tag_app/app/features/student/mappers/student_json_to_response.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/fast_enrollment/pages/classes_form/classes_form_page.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/fast_enrollment/pages/personal_data_form/personal_data_form_page.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/list/bloc/student_list_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/list/student_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/student_datasource.dart';
import 'data/repositories/student_repository_impl.dart';
import 'domain/usecases/fast_enrollment_usecase.dart';
import 'domain/usecases/list_student_usecase.dart';
import 'presentation/fast_enrollment/bloc/enrollment_bloc.dart';
import 'presentation/fast_enrollment/enrollment_page.dart';

class StudentModule extends Module {
  @override
  final List<Bind> binds = [
    // mappers
    Bind.factory((i) => StudentJsonToMapMapper()),
    Bind.factory((i) => StudentApiToEntityMapper()),

    // datasources
    Bind.factory((i) => StudentRemoteDataSource(i.get(), i.get())),

    // repositories
    Bind.factory((i) => StudentRepositoryImpl(i.get(), i.get())),

    // usecases
    Bind.factory((i) => FastEnrollmentUsecase(i.get())),
    Bind.factory((i) => ListStudentsUsecase(i.get())),

    // list
    Bind.factory((i) => StudentListBloc(i.get())),

    //enrollment
    Bind.factory((i) => EnrollmentBloc(i.get())),
  ];

  @override
  final List<ModularRoute<void>> routes = [
    ChildRoute("/", child: (_, args) => const StudentPage()),
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
