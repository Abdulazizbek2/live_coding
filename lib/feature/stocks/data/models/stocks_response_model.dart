import 'package:equatable/equatable.dart';

import 'stock_model.dart';

class StocksResponseModel extends Equatable {
  final List<StockModel> data;
  final int count;

  const StocksResponseModel({
    required this.data,
    required this.count,
  });

  factory StocksResponseModel.fromJson(Map<String, dynamic> json) {
    return StocksResponseModel(
      data: (json['data'] as List<dynamic>).map((item) => StockModel.fromJson(item as Map<String, dynamic>)).toList(),
      count: json['meta']['count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((stock) => stock.toJson()).toList(),
      'meta': {'count': count},
    };
  }

  @override
  List<Object?> get props => [data, count];
}
