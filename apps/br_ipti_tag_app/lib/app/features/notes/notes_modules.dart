import 'package:br_ipti_tag_app/app/features/notes/presentation/details_classroom/details_classroom.dart';
import 'package:br_ipti_tag_app/app/features/notes/presentation/details_notes/details_notes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';


class NotesModules extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

 
  
  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) =>  const DetailsNotes(student: StudentClassRoom(name: "jonny"))),
    ChildRoute("/student", child: (_, args) =>  DetailsNotes(student: args.data as StudentClassRoom,)),
  ];
}
