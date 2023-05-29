
import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class ClassPlan extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  final List<Bind> binds = [
    // BlocBind.singleton((i) => ControllerPlanClass()),
    // BlocBind.singleton((i) => CreateClassBloc()),
  ];

  
  @override
  final List<ModularRoute> routes = [
    // ChildRoute("/", child: (_, args) =>  const ListPlans()),
    // ChildRoute("/create", child: (_, args) =>  const CreateClassPlans()),
  ];
}