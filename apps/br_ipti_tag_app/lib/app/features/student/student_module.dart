import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/enrollment_module.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/fast_enrollment/pages/_classes_form_partial_page.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/fast_enrollment/pages/_personal_form_partial_page.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/list/student_list_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/fast_enrollment/pages/enrollment_page.dart';

class StudentModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  final List<Bind> binds = [];

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
