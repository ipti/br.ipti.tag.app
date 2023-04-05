import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/create/bloc/classroom_create_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/list/bloc/classroom_list_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/classroom_update_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/update_teacher/update_teacher_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/cubit/tab_controller_cubit.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_delete_classroom_page.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_student_page.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_teacher_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:tag_sdk/tag_sdk.dart';

import '../teacher/domain/usecases/list_teachers_usecase.dart';
import '../teacher/teacher_module.dart';
import 'domain/usecases/create_classroom_usecase.dart';
import 'domain/usecases/create_instructor_teaching_data_usecase.dart';
import 'domain/usecases/delete_classroom_usecase.dart';
import 'domain/usecases/list_classrooms_usecase.dart';
import 'domain/usecases/list_instructors_teaching_data_usecase.dart';
import 'domain/usecases/update_classroom_usecase.dart';
import 'domain/usecases/update_instructor_teaching_data_usecase.dart';
import 'presentation/create/classroom_create_page.dart';
import 'presentation/list/classroom_page.dart';

class ClassroomModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        TeacherSDKModule(),
        EdcensoDiciplinesSDKModule(),
        ClassroomSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    // usecases
    Bind.singleton(
          (i) => ListInstructorsUsecase(
        i.get<InstructorRepositoryImpl>(),
      ),
    ),

    // List
    Bind.singleton(
          (i) => ListClassroomsUsecase(
        i.get<ClassroomRepositoryImpl>(),
      ),
    ),

    Bind.singleton(
          (i) => ListInstructorsTeachingDataUseCase(
        i.get<ClassroomRepositoryImpl>(),
      ),
    ),

    // Create
    Bind.singleton(
          (i) => CreateClassroomUsecase(
        i.get<ClassroomRepositoryImpl>(),
      ),
    ),
    Bind.singleton(
          (i) => CreateInstructorTeachingDataUseCase(
        i.get<ClassroomRepositoryImpl>(),
      ),
    ),

    //UpdateDelete
    Bind.singleton(
          (i) => UpdateClassroomUsecase(
        i.get<ClassroomRepositoryImpl>(),
      ),
    ),
    Bind.singleton(
          (i) => DeleteClassroomUsecase(
        i.get<ClassroomRepositoryImpl>(),
      ),
    ),
    Bind.singleton(
          (i) => CreateInstructorTeachingDataUseCase(
        i.get<ClassroomRepositoryImpl>(),
      ),
    ),
    Bind.singleton(
          (i) => UpdateInstructorTeachingDataUseCase(
        i.get<ClassroomRepositoryImpl>(),
      ),
    ),

    // Create
    BlocBind.singleton((i) => ClassroomCreateBloc(
          i.get<CreateClassroomUsecase>(),
        )),

    //UpdateDelete
    BlocBind.factory((i) => InstructorFormBloc(
          i.get<ListInstructorsUsecase>(),
          i.get<ListEdcensoDisciplineUsecase>(),
          i.get<CreateInstructorTeachingDataUseCase>(),
          i.get<UpdateInstructorTeachingDataUseCase>(),
        )),
    BlocBind.singleton((i) => ClassroomUpdateDeleteBloc(
          i.get<DeleteClassroomUsecase>(),
          i.get<UpdateClassroomUsecase>(),
        )),
    Bind.singleton(
      (i) => TabControllerCubit(),
    ),
    BlocBind.singleton(
      (i) => UpdateTeacherBloc(
        i.get<ListInstructorsTeachingDataUseCase>(),
        i.get<ListEdcensoDisciplineUsecase>(),
        i.get<ListInstructorsUsecase>(),
      ),
    ),
    BlocBind.singleton(
      (i) => ClassroomListBloc(
        i.get<ListClassroomsUsecase>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const ClassroomPage(),
    ),
    ChildRoute(
      "/create",
      child: (_, args) => const ClassroomCreatePage(),
    ),
    ChildRoute(
      "/updatePage",
      child: (_, args) => UpdateDeleteClassroomPage(
        classroomEntity: args.data,
      ),
    ),
    ChildRoute(
      "/updateTeacher",
      child: (_, args) => ClassroomTeacherPage(
        classroomId: args.data,
      ),
    ),
    ChildRoute(
      "/updateStudent",
      child: (_, args) => const ClassroomStudentPage(),
    ),
    ChildRoute(
      "/updateInfos",
      child: (_, args) => const ClassroomBasicDataForm(),
    ),
  ];
}
