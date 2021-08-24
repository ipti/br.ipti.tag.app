import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/stock_bloc.dart';
import 'stock_page.dart';

class StockModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => new StockBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => StockPage()),
  ];
}
