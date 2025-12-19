import 'package:equatable/equatable.dart';

import 'stock_price_model.dart';

class StockModel extends Equatable {
  final int id;
  final String companyName;
  final String tradingSymbol;
  final String logo;
  final String currency;
  final bool shariahCheck;
  final DateTime analysisDate;
  final bool isCompliant;
  final StockPriceModel price;

  const StockModel({
    required this.id,
    required this.companyName,
    required this.tradingSymbol,
    required this.logo,
    required this.currency,
    required this.shariahCheck,
    required this.analysisDate,
    required this.isCompliant,
    required this.price,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      id: json['id'] as int,
      companyName: json['companyName'] as String,
      tradingSymbol: json['tradingSymbol'] as String,
      logo: json['logo'] as String,
      currency: json['currency'] as String,
      shariahCheck: json['shariahCheck'] as bool,
      analysisDate: DateTime.parse(json['analysisDate'] as String),
      isCompliant: json['isCompliant'] as bool,
      price: StockPriceModel.fromJson(json['price'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'tradingSymbol': tradingSymbol,
      'logo': logo,
      'currency': currency,
      'shariahCheck': shariahCheck,
      'analysisDate': analysisDate.toIso8601String(),
      'isCompliant': isCompliant,
      'price': price.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        companyName,
        tradingSymbol,
        logo,
        currency,
        shariahCheck,
        analysisDate,
        isCompliant,
        price,
      ];
}
