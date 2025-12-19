import 'package:equatable/equatable.dart';

class StockPriceModel extends Equatable {
  final double price;
  final double changePercent;

  const StockPriceModel({
    required this.price,
    required this.changePercent,
  });

  factory StockPriceModel.fromJson(Map<String, dynamic> json) {
    return StockPriceModel(
      price: (json['price'] as num).toDouble(),
      changePercent: (json['changePercent'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'changePercent': changePercent,
    };
  }

  @override
  List<Object?> get props => [price, changePercent];
}
