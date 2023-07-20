import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import '../../app_module.dart';
import 'domain/usecases/list_student_usecase.dart';
import 'domain/usecases/load_student_usecase.dart';

class StudentModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        StudentSDKModule(),
      ];

  @override
  final List<Bind> binds = [
    // Usecases
    Bind.factory(
      (i) => ListStudentsUsecase(
        i.get<StudentRepositoryImpl>(),
      ),
    ),

    Bind.factory(
      (i) => LoadStudentUsecase(
        i.get<StudentRepositoryImpl>(),
      ),
    ),
  ];

}
