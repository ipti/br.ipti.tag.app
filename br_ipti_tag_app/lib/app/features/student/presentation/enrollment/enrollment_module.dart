import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/enrollment_bloc.dart';
import 'enrollment_page.dart';
import 'form/address/_address_form_partial_page.dart';
import 'form/classroom/_classes_form_partial_page.dart';
import 'form/filliation/_filiation_form_partial_page.dart';
import 'form/personal/_personal_form_partial_page.dart';
import 'form/social/_social_form_partial_page.dart';

class EnrollmentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => EnrollmentBloc(i.get())),
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
