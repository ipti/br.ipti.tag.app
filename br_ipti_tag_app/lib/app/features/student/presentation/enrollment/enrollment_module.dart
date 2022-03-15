import 'package:br_ipti_tag_app/app/core/network/service/router.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_cities_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/domain/usecases/list_ufs_usecase.dart';
import 'package:br_ipti_tag_app/app/features/edcenso_locations/edcenso_locations_module.dart';
import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/classroom_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/student_doc_address_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/student_enrollment_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/repositories/classroom_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/student/data/repositories/student_docs_addrs_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/student/data/repositories/student_enrollment_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/classroom_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_doc_address_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_enrollment_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/change_filiation_student_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_documents_and_address.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_student_enrollment_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_student_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/load_student_docs_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/load_student_enrollment_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/load_student_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/update_address_documents_usecase.dart';
import 'package:br_ipti_tag_app/app/shared/util/enums/edit_mode.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/enrollment_bloc.dart';
import 'enrollment_page.dart';
import 'form/address/bloc/enrollment_address_bloc.dart';
import 'form/classroom/bloc/enrollment_classroom_bloc.dart';
import 'form/filliation/bloc/enrollment_filiation_bloc.dart';
import 'form/personal/bloc/enrollment_personal_bloc.dart';
import 'form/social/bloc/enrollment_social_bloc.dart';

class EnrollmentModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasources
    Bind.singleton(
      (i) => StudentDocumentsAndAddressRemoteDataSource(
        i.get<RouterAPI>(),
      ),
    ),
    Bind.singleton(
      (i) => ClassroomRemoteDataSource(
        i.get<RouterAPI>(),
      ),
    ),
    Bind.singleton(
      (i) => StudentEnrollmenrRemoteDataSource(
        i.get<RouterAPI>(),
      ),
    ),

    // Repositories
    Bind.singleton(
      (i) => ClassroomRepositoryImpl(
        i.get<ClassroomRemoteDataSource>(),
      ),
    ),
    Bind.singleton(
      (i) => StudentDocumentsAddressRepositoryImpl(
        i.get<StudentDocumentsAndAddressRemoteDataSource>(),
      ),
    ),
    Bind.singleton(
      (i) => StudentEnrollmentRepositoryImpl(
        i.get<StudentEnrollmenrRemoteDataSource>(),
      ),
    ),

    // Usecases
    Bind.singleton(
      (i) => CreateStudentEnrollmentUsecase(
        i.get<StudentEnrollmentRepository>(),
      ),
    ),
    Bind.singleton(
      (i) => ListClassroomsUsecase(
        i.get<ClassroomRepository>(),
      ),
    ),
    Bind.singleton(
      (i) => AddDocumentsAndAddressToStudentUsecase(
        i.get<StudentDocumentsAddressRepository>(),
      ),
    ),
    Bind.singleton(
      (i) => CreateStudentsUsecase(
        i.get<StudentRepository>(),
      ),
    ),
    Bind.singleton(
      (i) => ChangeFiliationStudentUsecase(
        i.get<StudentRepository>(),
      ),
    ),
    Bind.singleton(
      (i) => LoadStudentUsecase(
        i.get<StudentRepository>(),
      ),
    ),

    Bind.singleton(
      (i) => LoadStudentDocsUsecase(
        i.get<StudentDocumentsAddressRepository>(),
      ),
    ),
    Bind.singleton(
      (i) => UpdateDocumentsAndAddressUsecase(
        i.get<StudentDocumentsAddressRepository>(),
      ),
    ),
    Bind.singleton(
      (i) => LoadStudentEnrollmentUsecase(
        i.get<StudentEnrollmentRepository>(),
      ),
    ),

    // Blocs
    Bind.singleton(
      (i) => EnrollmentBloc(
        i.get<LoadStudentDocsUsecase>(),
        i.get<LoadStudentEnrollmentUsecase>(),
      ),
    ),
    Bind.singleton(
      (i) => EnrollmentSocialBloc(
        i.get<AddDocumentsAndAddressToStudentUsecase>(),
        i.get<UpdateDocumentsAndAddressUsecase>(),
      ),
    ),
    Bind.singleton(
      (i) => EnrollmentPersonalBloc(
        i.get<CreateStudentsUsecase>(),
      ),
    ),
    Bind.singleton(
      (i) => EnrollmentAddressBloc(
        i.get<ListCitiesUsecase>(),
        i.get<ListUFsUsecase>(),
        i.get<UpdateDocumentsAndAddressUsecase>(),
      ),
    ),
    Bind.singleton(
      (i) => EnrollmentFiliationBloc(
        i.get<ChangeFiliationStudentUsecase>(),
      ),
    ),
    Bind.singleton(
      (i) => EnrollmentClassroomBloc(
        i.get<ListClassroomsUsecase>(),
        i.get<CreateStudentEnrollmentUsecase>(),
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
