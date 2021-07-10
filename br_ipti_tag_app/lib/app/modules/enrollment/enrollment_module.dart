import 'package:br_ipti_tag_app/app/domain/data/repositories/student_repository.dart';
import 'package:br_ipti_tag_app/app/domain/domain/services/student_service.dart';
import 'package:br_ipti_tag_app/app/domain/domain/usecases/fast_enrollment_usecase.dart';
import 'package:br_ipti_tag_app/app/modules/enrollment/submodules/address_form/address_form_module.dart';
import 'package:br_ipti_tag_app/app/modules/enrollment/submodules/classes_form/classes_form_module.dart';
import 'package:br_ipti_tag_app/app/modules/enrollment/submodules/personal_data_form/personal_data_form_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/enrollment_bloc.dart';
import 'enrollment_page.dart';
import 'submodules/address_form/bloc/address_form_bloc.dart';
import 'submodules/address_form/bloc/address_form_states.dart';
import 'submodules/classes_form/bloc/classes_form_bloc.dart';
import 'submodules/classes_form/bloc/classes_form_states.dart';
import 'submodules/personal_data_form/bloc/personal_form_bloc.dart';
import 'submodules/personal_data_form/bloc/personal_form_states.dart';

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
    ChildRoute("/matricula-rapida",
        child: (_, args) => EnrollmentPage(),
        children: [
          ModuleRoute('/personal', module: PersonalDataFormModule()),
          ModuleRoute('/address', module: AddressFormModule()),
          ModuleRoute('/classes', module: ClassesFormModule()),
        ])
  ];
}
