import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/stocks_response_model.dart';

part 'stocks_remote_data_source_impl.dart';

abstract class StocksRemoteDataSource {
  Future<StocksResponseModel> getStocksList();
}

/// HTTP client без проверки SSL сертификата (только для разработки!)
class InsecureHttpClient extends http.BaseClient {
  final HttpClient _httpClient = HttpClient()
    ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final ioRequest = await _httpClient.openUrl(request.method, request.url);

    // Копируем заголовки
    request.headers.forEach((key, value) {
      ioRequest.headers.set(key, value);
    });

    // Добавляем тело запроса если есть
    if (request.contentLength != null && request.contentLength! > 0) {
      final body = await request.finalize().toBytes();
      ioRequest.add(body);
    }

    final ioResponse = await ioRequest.close();
    final headers = <String, String>{};
    ioResponse.headers.forEach((key, values) {
      headers[key] = values.join(',');
    });

    return http.StreamedResponse(
      ioResponse,
      ioResponse.statusCode,
      contentLength: ioResponse.contentLength == -1 ? null : ioResponse.contentLength,
      headers: headers,
      reasonPhrase: ioResponse.reasonPhrase,
    );
  }

  @override
  void close() {
    _httpClient.close();
  }
}
