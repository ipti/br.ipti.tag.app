import 'package:flutter_modular/flutter_modular.dart';

import 'manage_item_stock_page.dart';

class ManageItemStockModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => ManageItemStockPage())
  ];
}
