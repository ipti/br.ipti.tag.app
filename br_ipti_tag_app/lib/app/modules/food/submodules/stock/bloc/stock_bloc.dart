import 'package:flutter_bloc/flutter_bloc.dart';

import 'stock_events.dart';
import 'stock_states.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(const StockState());

  @override
  Stream<StockState> mapEventToState(StockEvent event) async* {
    yield state;
  }
}
