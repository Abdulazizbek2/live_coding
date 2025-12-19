import 'package:equatable/equatable.dart';

abstract class StocksEvent extends Equatable {
  const StocksEvent();

  @override
  List<Object?> get props => [];
}

class LoadStocks extends StocksEvent {}

class RefreshStocks extends StocksEvent {}
