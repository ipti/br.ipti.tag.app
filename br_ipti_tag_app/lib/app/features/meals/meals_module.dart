import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/manage_item_stock/bloc/stock_bloc.dart';
import 'presentation/manage_item_stock/manage_item_stock_page.dart';

class MealsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => new ManageItemStockBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/estoque", child: (_, args) => ManageItemStockPage()),
    // ChildRoute("/cardapio", child: (_, args) => Meal());
  ];
}
