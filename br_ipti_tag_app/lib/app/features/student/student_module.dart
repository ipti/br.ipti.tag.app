import 'package:br_ipti_tag_app/app/features/student/presentation/list/bloc/student_list_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/list/student_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/student_datasource.dart';
import 'data/repositories/student_repository_impl.dart';
import 'domain/usecases/fast_enrollment_usecase.dart';
import 'domain/usecases/list_classrooms_usecase.dart';
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

class StudentModule extends Module {
  @override
  final List<Bind> binds = [
    // datasources
    Bind.lazySingleton((i) => StudentDataSource(i.get())),
    // repositories
    Bind.lazySingleton((i) => StudentRepositoryImpl(i.get())),
    // usecases
    Bind.lazySingleton((i) => FastEnrollmentUsecase(i.get())),
    Bind.lazySingleton((i) => ListStudentsUsecase(i.get())),

    // list
    Bind.lazySingleton((i) => StudentListBloc(i.get())),

    //enrollment
    Bind.singleton((i) => EnrollmentBloc()),
    // PersonalForm
    Bind.singleton((i) => const PersonalFormState()),
    Bind.singleton((i) => PersonalFormBloc(i.get())),
    // AddressForm
    Bind.singleton((i) => const AddressFormState()),
    Bind.singleton((i) => AddressFormBloc(i.get())),
    // ClassesForm
    Bind.singleton((i) => const ClassesFormState()),
    Bind.singleton((i) => ClassesFormBloc(i.get())),
  ];

  @override
  final List<ModularRoute<void>> routes = [
    ChildRoute("/", child: (_, args) => const StudentPage()),
    ChildRoute(
      "/matricula-rapida",
      child: (_, args) => const EnrollmentPage(),
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