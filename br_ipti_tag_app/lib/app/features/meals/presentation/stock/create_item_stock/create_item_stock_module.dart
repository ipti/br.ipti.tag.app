import 'package:flutter_modular/flutter_modular.dart';

import 'create_item_stock_page.dart';

class CreateItemStockModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute<void>> routes = [
    ChildRoute("/", child: (_, args) => const CreateItemStockPage())
  ];
}
