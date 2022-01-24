import 'package:br_ipti_tag_app/app/features/edcenso_locations/edcenso_locations_module.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/change_filiation_student_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_student_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enrollment_page.dart';
import 'form/address/_address_form_partial_page.dart';
import 'form/address/bloc/enrollment_address_bloc.dart';
import 'form/classroom/_classes_form_partial_page.dart';
import 'form/classroom/bloc/enrollment_classroom_bloc.dart';
import 'form/filliation/_filiation_form_partial_page.dart';
import 'form/filliation/bloc/enrollment_filiation_bloc.dart';
import 'form/personal/_personal_form_partial_page.dart';
import 'form/personal/bloc/enrollment_personal_bloc.dart';
import 'form/social/_social_form_partial_page.dart';
import 'form/social/bloc/enrollment_social_bloc.dart';

class EnrollmentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => CreateStudentsUsecase(i.get())),
    Bind.factory((i) => ChangeFiliationStudentUsecase(i.get())),
    Bind.singleton((i) => EnrollmentSocialBloc(i.get())),
    Bind.singleton((i) => EnrollmentPersonalBloc(i.get())),
    Bind.singleton((i) => EnrollmentAddressBloc(i.get(), i.get())),
    Bind.singleton((i) => EnrollmentFiliationBloc(i.get())),
    Bind.singleton((i) => EnrollmentClassroomBloc()),
  ];

  @override
  List<Module> get imports => [
        EdcensoLocationsModule(),
      ];

  @override
  final List<ModularRoute<void>> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const EnrollmentPage(),
      children: [
        ChildRoute(
          '/pessoal',
          child: (_, args) => const PersonalDataFormPage(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/filiacao',
          child: (_, args) => const FiliationFormPage(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/endereco',
          child: (_, args) => const AddressFormPage(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/social',
          child: (_, args) => const SocialFormPage(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/turma',
          child: (_, args) => const ClassesFormPage(),
          transition: TransitionType.rightToLeft,
        ),
      ],
    ),
  ];
}
