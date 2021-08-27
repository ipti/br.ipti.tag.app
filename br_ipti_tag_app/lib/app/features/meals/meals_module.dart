import 'package:br_ipti_tag_app/app/features/meals/data/datasources/meals_of_day_dumb_datasource.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/repositories/meals_of_day_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/usecases/list_meals_of_day_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/list_meals/bloc/list_meals_bloc.dart';
import 'presentation/list_meals/list_meals_page.dart';

class MealsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => new MealsOfDayDumbDataSourceImpl()),
    Bind.singleton((i) => new MealsOfDayRepositoryImpl(
          dumbDataSource: i.get(),
        )),
    Bind.singleton((i) => new ListMealsOfDayUsecase(i.get())),
    Bind.singleton((i) => new ListMealsBloc(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/estoque", child: (_, args) => ListMealsPage()),
    // ChildRoute("/cardapio", child: (_, args) => Meal());
  ];
}
