
import 'package:br_ipti_tag_app/app/app_module.dart';
import 'package:br_ipti_tag_app/app/features/class_diary/presentation/details_class_diary/details_class_diary.dart';
import 'package:br_ipti_tag_app/app/features/class_diary/presentation/list_class_diary/list_class_diary.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class ClassDiary extends Module {
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
     ChildRoute("/", child: (_, args) =>  const ListClassDiary()),
     ChildRoute("/details", child: (_, args) =>  const DetailsClassDiary()),
  ];
}
