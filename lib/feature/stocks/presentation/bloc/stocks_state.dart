import 'package:equatable/equatable.dart';

import '../../domain/entities/stock_entity.dart';

abstract class StocksState extends Equatable {
  const StocksState();

  @override
  List<Object?> get props => [];
}

class StocksInitial extends StocksState {}

class StocksLoading extends StocksState {}

class StocksLoaded extends StocksState {
  final List<StockEntity> stocks;

  const StocksLoaded({required this.stocks});

  @override
  List<Object?> get props => [stocks];
}

class StocksError extends StocksState {
  final String message;

  const StocksError({required this.message});

  @override
  List<Object?> get props => [message];
}
