import 'package:br_ipti_tag_app/app/domain/data/repositories/student_repository.dart';
import 'package:br_ipti_tag_app/app/domain/domain/services/student_service.dart';
import 'package:br_ipti_tag_app/app/domain/domain/usecases/fast_enrollment_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'create_item_stock_page.dart';

class CreateItemStockModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => new StudentRepository(i.get())),
    Bind.lazySingleton((i) => new StudentService(i.get())),
    Bind.lazySingleton((i) => new FastEnrollmentUsecase(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => CreateItemStockPage())
  ];
}
