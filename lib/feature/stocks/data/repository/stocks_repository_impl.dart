import '../../domain/entities/stock_entity.dart';
import '../../domain/entities/stock_price_entity.dart';
import '../../domain/repository/stocks_repository.dart';
import '../data_source/stocks_remote_data_source.dart';

class StocksRepositoryImpl implements StocksRepository {
  final StocksRemoteDataSource remoteDataSource;

  StocksRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<StockEntity>> getStocksList() async {
    try {
      final response = await remoteDataSource.getStocksList();
      
      return response.data.map((stockModel) {
        return StockEntity(
          id: stockModel.id,
          companyName: stockModel.companyName,
          tradingSymbol: stockModel.tradingSymbol,
          logo: stockModel.logo,
          currency: stockModel.currency,
          shariahCheck: stockModel.shariahCheck,
          analysisDate: stockModel.analysisDate,
          isCompliant: stockModel.isCompliant,
          price: StockPriceEntity(
            price: stockModel.price.price,
            changePercent: stockModel.price.changePercent,
          ),
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to get stocks: $e');
    }
  }
}
