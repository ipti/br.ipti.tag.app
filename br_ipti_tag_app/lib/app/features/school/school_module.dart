import 'package:br_ipti_tag_app/app/features/school/data/datasources/school_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/school/data/repositories/school_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/usecases/edit_school_usecase.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/usecases/show_school_usecase.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/cubit/school_cubit.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/pages/school_edit_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SchoolModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
        // Datasources
        Bind.factory((i) => SchoolRemoteDataSource(i.get())),

        // Repositories
        Bind.singleton((i) => SchoolRepositoryImpl(i.get())),

        // UseCases
        Bind.singleton((i) => EditSchoolUsecase(i.get())),
        Bind.singleton((i) => ShowSchoolUsecase(i.get())),

        // Cubic(States)
        Bind.singleton((i) => SchoolCubit(
              i.get<EditSchoolUsecase>(),
              i.get<ShowSchoolUsecase>(),
            ))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/editar", child: (_, args) => const SchoolEditPage()),
      ];
}
