import '../entities/stock_entity.dart';

abstract class StocksRepository {
  Future<List<StockEntity>> getStocksList();
}
