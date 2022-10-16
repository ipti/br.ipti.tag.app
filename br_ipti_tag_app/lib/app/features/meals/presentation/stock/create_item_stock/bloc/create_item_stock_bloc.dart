import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'create_item_stock_events.dart';
import 'create_item_stock_states.dart';

class CreateItemStockBloc
    extends Bloc<CreateItemStockEvent, CreateItemStockState> {
  CreateItemStockBloc() : super(const CreateItemStockState());

  void tabNavigation(int index) {
    switch (index) {
      case 0:
        Modular.to.navigate('/alunos/matricula-rapida/personal');
        break;
      case 1:
        Modular.to.navigate('/alunos/matricula-rapida/address');
        break;
      case 2:
        Modular.to.navigate('/alunos/matricula-rapida/classes');
        break;
      default:
    }
  }
}
