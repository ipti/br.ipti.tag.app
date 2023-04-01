import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/features/student/enrollment/enrollment_module.dart';
import 'package:br_ipti_tag_app/app/features/student/fast_enrollment/pages/_classes_form_partial_page.dart';
import 'package:br_ipti_tag_app/app/features/student/fast_enrollment/pages/_personal_form_partial_page.dart';
import 'package:br_ipti_tag_app/app/features/student/list/student_list_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'domain/usecases/create_documents_and_address.dart';
import 'domain/usecases/create_student_enrollment_usecase.dart';
import 'domain/usecases/create_student_usecase.dart';
import 'domain/usecases/list_student_usecase.dart';
import 'domain/usecases/load_student_docs_usecase.dart';
import 'domain/usecases/load_student_enrollment_usecase.dart';
import 'domain/usecases/update_address_documents_usecase.dart';
import 'domain/usecases/update_student_enrollment_usecase.dart';
import 'domain/usecases/update_student_usecase.dart';
import 'fast_enrollment/pages/enrollment_page.dart';

class StudentModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  final List<Bind> binds = [
    // Usecases
    Bind.factory(
          (i) => ListStudentsUsecase(
        i.get<StudentRepositoryImpl>(),
      ),
    ),
    Bind.factory(
          (i) => UpdateStudentUsecase(
        i.get<StudentRepositoryImpl>(),
      ),
    ),
    Bind.factory(
          (i) => CreateStudentsUsecase(
        i.get<StudentRepositoryImpl>(),
      ),
    ),
    Bind.factory(
          (i) => LoadStudentEnrollmentUsecase(
        i.get<StudentEnrollmentRepositoryImpl>(),
      ),
    ),
    Bind.factory(
          (i) => CreateStudentEnrollmentUsecase(
        i.get<StudentEnrollmentRepositoryImpl>(),
      ),
    ),
    Bind.factory(
          (i) => UpdateStudentEnrollmentUsecase(
        i.get<StudentEnrollmentRepositoryImpl>(),
      ),
    ),
    Bind.factory(
          (i) => LoadStudentDocsUsecase(
        i.get<StudentDocumentsAddressRepositoryImpl>(),
      ),
    ),
    Bind.factory(
          (i) => UpdateDocumentsAndAddressUsecase(
        i.get<StudentDocumentsAddressRepositoryImpl>(),
      ),
    ),
    Bind.factory(
          (i) => AddDocumentsAndAddressToStudentUsecase(
        i.get<StudentDocumentsAddressRepositoryImpl>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      "/",
      module: StudentListModule(),
    ),
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
