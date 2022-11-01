import 'package:br_ipti_tag_app/app/app_module.dart';

import 'package:br_ipti_tag_app/app/features/school/presentation/cubit/school_cubit.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/pages/school_edit_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

class SchoolModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  List<Bind<Object>> get binds => [
        // Datasources
        Bind.singleton((i) => SchoolRemoteDataSource(
              i.get(),
            )),

        // Repositories
        Bind.singleton((i) => SchoolRepositoryImpl(
              i.get(),
            )),

        // UseCases
        Bind.singleton(
          (i) => EditSchoolUsecase(
            i.get<SchoolRepositoryImpl>(),
          ),
        ),
        Bind.singleton((i) => ShowSchoolUsecase(
              i.get(),
            )),

        // Cubic(States)
        Bind.singleton(
          (i) => SchoolCubit(
            i.get<EditSchoolUsecase>(),
            i.get<ShowSchoolUsecase>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, args) => const SchoolEditPage(),
        ),
      ];
}
