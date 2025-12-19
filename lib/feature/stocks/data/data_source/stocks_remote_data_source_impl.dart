part of 'stocks_remote_data_source.dart';

class StocksRemoteDataSourceImpl implements StocksRemoteDataSource {
  final http.Client client;
  static const String baseUrl = 'https://dev.codeunion.kz/ailat/api';

  StocksRemoteDataSourceImpl({required this.client});

  @override
  Future<StocksResponseModel> getStocksList() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/stocks/list/'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        return StocksResponseModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load stocks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load stocks: $e');
    }
  }
}
