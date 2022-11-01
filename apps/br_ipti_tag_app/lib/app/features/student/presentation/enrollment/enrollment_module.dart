import 'package:br_ipti_tag_app/app/core/util/enums/edit_mode.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'bloc/enrollment_bloc.dart';
import 'enrollment_page.dart';
import 'form/address/bloc/enrollment_address_bloc.dart';
import 'form/classroom/bloc/enrollment_classroom_bloc.dart';
import 'form/filliation/bloc/enrollment_filiation_bloc.dart';
import 'form/personal/bloc/enrollment_personal_bloc.dart';

class EnrollmentModule extends Module {
  @override
  final List<Bind> binds = [
    // Blocs
    BlocBind.singleton(
      (i) => EnrollmentBloc(
        i.get<LoadStudentDocsUsecase>(),
        i.get<LoadStudentEnrollmentUsecase>(),
      ),
    ),
    BlocBind.singleton(
      (i) => EnrollmentPersonalBloc(
        i.get<CreateStudentsUsecase>(),
        i.get<UpdateStudentUsecase>(),
      ),
    ),
    BlocBind.singleton(
      (i) => EnrollmentAddressBloc(
        i.get<ListCitiesUsecase>(),
        i.get<ListUFsUsecase>(),
        i.get<UpdateDocumentsAndAddressUsecase>(),
        i.get<AddDocumentsAndAddressToStudentUsecase>(),
      ),
    ),
    BlocBind.singleton(
      (i) => EnrollmentFiliationBloc(
        i.get<UpdateStudentUsecase>(),
      ),
    ),
    BlocBind.singleton(
      (i) => EnrollmentClassroomBloc(
        i.get<ListClassroomsUsecase>(),
        i.get<CreateStudentEnrollmentUsecase>(),
        i.get<UpdateStudentEnrollmentUsecase>(),
      ),
    ),
  ];

  @override
  List<Module> get imports => [
        EdcensoLocationsModule(),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => EnrollmentPage(
        student: args.data as Student?,
      ),
    ),
    ChildRoute(
      "/edit",
      child: (_, args) => EnrollmentPage(
        editMode: EditMode.Edit,
        student: args.data as Student?,
      ),
    ),
  ];
}
