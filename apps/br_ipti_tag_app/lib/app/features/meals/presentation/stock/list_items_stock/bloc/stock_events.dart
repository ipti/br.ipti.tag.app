import 'package:equatable/equatable.dart';

abstract class ListStockEvent extends Equatable {
  const ListStockEvent();

  @override
  List<Object> get props => [];
}

class GetListStockEvent extends ListStockEvent {}
