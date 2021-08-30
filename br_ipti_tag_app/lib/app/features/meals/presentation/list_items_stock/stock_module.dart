import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/stock_bloc.dart';
import 'stock_page.dart';

class StockModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StockBloc()),
  ];

  @override
  final List<ModularRoute<void>> routes = [
    ChildRoute("/", child: (_, args) => const StockPage()),
  ];
}
