import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repository/stocks_repository.dart';
import 'stocks_event.dart';
import 'stocks_state.dart';

class StocksBloc extends Bloc<StocksEvent, StocksState> {
  final StocksRepository repository;

  StocksBloc({required this.repository}) : super(StocksInitial()) {
    on<LoadStocks>(_onLoadStocks);
    on<RefreshStocks>(_onRefreshStocks);
  }

  Future<void> _onLoadStocks(
    LoadStocks event,
    Emitter<StocksState> emit,
  ) async {
    emit(StocksLoading());
    try {
      final stocks = await repository.getStocksList();
      emit(StocksLoaded(stocks: stocks));
    } catch (e) {
      emit(StocksError(message: e.toString()));
    }
  }

  Future<void> _onRefreshStocks(
    RefreshStocks event,
    Emitter<StocksState> emit,
  ) async {
    try {
      final stocks = await repository.getStocksList();
      emit(StocksLoaded(stocks: stocks));
    } catch (e) {
      emit(StocksError(message: e.toString()));
    }
  }
}
