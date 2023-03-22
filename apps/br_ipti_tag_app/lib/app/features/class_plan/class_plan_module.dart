
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/bloc/class_plan_bloc.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class_plans.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/list_plans/list_plans.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import '../../app_module.dart';


class ClassPlan extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  final List<Bind> binds = [
    BlocBind.singleton((i) => ControllerPlanClass()),
  ];

  
  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) =>  const ListPlans()),
    ChildRoute("/create", child: (_, args) =>  const CreateClassPlans()),
  ];
}