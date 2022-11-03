import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/features/frequency/presentation/cubit/frequency_cubit.dart';
import 'package:br_ipti_tag_app/app/features/frequency/presentation/pages/select_classroom_page.dart';
import 'package:br_ipti_tag_app/app/features/frequency/presentation/pages/select_discipline_page.dart';
import 'package:br_ipti_tag_app/app/features/student/list/student_list_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

import 'presentation/pages/frequency_page.dart';

class FrequencyModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        EdcensoDiciplinesSDKModule(),
        StudentListModule(),
      ];

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
    Bind.singleton((i) => ListClassroomsUsecase(
          i.get(),
        )),

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
      child: (_, args) => const FrequencySelectClassroomPage(),
    ),
    ChildRoute(
      "/selectDiscipline",
      child: (_, args) => FrequencySelectDisciplinePage(
        classroom: args.data as ClassroomEntity,
      ),
    ),
    ChildRoute(
      "/frequencia",
      child: (_, args) => FrequencyPage(
        classroom: (args.data as Map)["classroom"] as ClassroomEntity,
        discipline: (args.data as Map)["discipline"] as EdcensoDiscipline,
      ),
    ),
  ];
}
