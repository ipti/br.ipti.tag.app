import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/features/frequency/presentation/cubit/frequency_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import '../classroom/classroom_module.dart';
import '../classroom/domain/usecases/list_classrooms_usecase.dart';
import '../student/domain/usecases/list_student_usecase.dart';
import '../student/student_module.dart';
import 'presentation/pages/frequency_page.dart';

class FrequencyModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        EdcensoDiciplinesSDKModule(),
        StudentSDKModule(),
        ClassroomSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    // Usecases
    Bind.factory(
          (i) => ListStudentsUsecase(
        i.get<StudentRepositoryImpl>(),
      ),
    ),
    // List
    Bind.singleton(
          (i) => ListClassroomsUsecase(
        i.get<ClassroomRepositoryImpl>(),
      ),
    ),
    // Cubit
    Bind.singleton((i) => FrequencyCubit(
          i.get<ListClassroomsUsecase>(),
          i.get<ListEdcensoDisciplineUsecase>(),
          i.get<ListStudentsUsecase>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => const FrequencyPage(),
    ),
  ];
}
