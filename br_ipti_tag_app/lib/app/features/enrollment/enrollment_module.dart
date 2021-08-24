import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/student_repository.dart';
import 'domain/repositories/student_repositories.dart';
import 'domain/usecases/fast_enrollment_usecase.dart';
import 'presentation/fast_enrollment/bloc/enrollment_bloc.dart';
import 'presentation/fast_enrollment/enrollment_page.dart';
import 'presentation/fast_enrollment/submodules/address_form/address_form_module.dart';
import 'presentation/fast_enrollment/submodules/address_form/bloc/address_form_bloc.dart';
import 'presentation/fast_enrollment/submodules/address_form/bloc/address_form_states.dart';
import 'presentation/fast_enrollment/submodules/classes_form/bloc/classes_form_bloc.dart';
import 'presentation/fast_enrollment/submodules/classes_form/bloc/classes_form_states.dart';
import 'presentation/fast_enrollment/submodules/classes_form/classes_form_module.dart';
import 'presentation/fast_enrollment/submodules/personal_data_form/bloc/personal_form_bloc.dart';
import 'presentation/fast_enrollment/submodules/personal_data_form/bloc/personal_form_states.dart';
import 'presentation/fast_enrollment/submodules/personal_data_form/personal_data_form_module.dart';

class EnrollmentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => new StudentRepository(i.get())),
    Bind.lazySingleton((i) => new StudentService(i.get())),
    Bind.lazySingleton((i) => new FastEnrollmentUsecase(i.get())),
    Bind.singleton((i) => new EnrollmentBloc()),
    // PersonalForm
    Bind.singleton((i) => new PersonalFormState()),
    Bind.singleton((i) => new PersonalFormBloc(i.get())),
    // AddressForm
    Bind.singleton((i) => new AddressFormState()),
    Bind.singleton((i) => new AddressFormBloc(i.get())),
    // ClassesForm
    Bind.singleton((i) => new ClassesFormState()),
    Bind.singleton((i) => new ClassesFormBloc(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/matricula-rapida",
      child: (_, args) => EnrollmentPage(),
      children: [
        ModuleRoute(
          '/personal',
          module: PersonalDataFormModule(),
          transition: TransitionType.rightToLeft,
        ),
        ModuleRoute(
          '/address',
          module: AddressFormModule(),
          transition: TransitionType.rightToLeft,
        ),
        ModuleRoute(
          '/classes',
          module: ClassesFormModule(),
          transition: TransitionType.rightToLeft,
        ),
      ],
    ),
  ];
}
