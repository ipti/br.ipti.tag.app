import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'stock_events.dart';
import 'stock_states.dart';

class ManageItemStockBloc
    extends Bloc<ManageItemStockEvent, ManageItemStockState> {
  ManageItemStockBloc() : super(const ManageItemStockState());

  @override
  Stream<ManageItemStockState> mapEventToState(
      ManageItemStockEvent event) async* {
    yield state;
  }

  void tabNavigation(index) {
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
