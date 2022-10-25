import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/datasource/classroom_datasource.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/repositories/classroom_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/frequency/presentation/cubit/frequency_cubit.dart';
import 'package:br_ipti_tag_app/app/features/frequency/presentation/pages/select_classroom_page.dart';
import 'package:br_ipti_tag_app/app/features/frequency/presentation/pages/select_discipline_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FrequencyModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
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
          i.get(),
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
  ];
}
