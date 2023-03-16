
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class_plans.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/list_plans/list_plans.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';


class ClassPlan extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

 
  
  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) =>  const ListPlans()),
    ChildRoute("/create", child: (_, args) =>  CreateClassPlans()),
  ];
}