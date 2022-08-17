import 'package:br_ipti_tag_app/app/features/classroom/data/datasource/classroom_datasource.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/repositories/classroom_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/create_classroom_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/create_instructor_teaching_data_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/delete_classroom_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_edcenso_disciplines_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_teaching_data_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/update_classroom_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/update_instructor_teaching_data_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/create/bloc/classroom_create_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/classroom_update_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/instructor_form/instructor_form_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/bloc/update_teacher/update_teacher_bloc.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/cubit/tab_controller_cubit.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_delete_classroom_page.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_student_page.dart';
import 'package:br_ipti_tag_app/app/features/classroom/presentation/update_delete/update_teacher_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/create/classroom_create_page.dart';
import 'presentation/list/bloc/classroom_list_bloc.dart';
import 'presentation/list/classroom_page.dart';

class ClassroomModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasource
    Bind.factory(
      (i) => ClassroomRemoteDataSource(
        i.get(),
      ),
    ),
    // Repositories
    Bind.singleton(
      (i) => ClassroomRepositoryImpl(
        classroomRemoteDataSource: i.get(),
      ),
    ),

    // List
    Bind.singleton((i) => ListClassroomsUsecase(i.get())),
    Bind.singleton((i) => ClassroomListBloc(i.get())),
    Bind.singleton((i) => ListInstructorsUseCase(i.get())),
    Bind.singleton((i) => ListInstructorsTeachingDataUseCase(i.get())),
    Bind.singleton((i) => ListEdcensoDisciplinesUseCase(i.get())),

    // Create
    Bind.singleton((i) => CreateClassroomUsecase(i.get())),
    Bind.singleton((i) => ClassroomCreateBloc(i.get())),
    Bind.singleton((i) => CreateInstructorTeachingDataUseCase(i.get())),

    //UpdateDelete
    Bind.singleton((i) => UpdateClassroomUsecase(i.get())),
    Bind.singleton((i) => DeleteClassroomUsecase(i.get())),
    Bind.singleton((i) => CreateInstructorTeachingDataUseCase(i.get())),
    Bind.singleton((i) => UpdateInstructorTeachingDataUseCase(i.get())),
    Bind.factory((i) => InstructorFormBloc(i.get(), i.get(), i.get(), i.get())),
    Bind.singleton((i) => ClassroomUpdateDeleteBloc(i.get(), i.get())),
    Bind.singleton((i) => TabControllerCubit()),
    Bind.singleton((i) => UpdateTeacherBloc(i.get(), i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => const ClassroomPage()),
    ChildRoute("/create", child: (_, args) => const ClassroomCreatePage()),
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
    ChildRoute("/updateStudent",
        child: (_, args) => const ClassroomStudentPage()),
    ChildRoute("/updateInfos",
        child: (_, args) => const ClassroomBasicDataForm()),
  ];
}
