import 'package:equatable/equatable.dart';

import 'stock_price_entity.dart';

class StockEntity extends Equatable {
  final int id;
  final String companyName;
  final String tradingSymbol;
  final String logo;
  final String currency;
  final bool shariahCheck;
  final DateTime analysisDate;
  final bool isCompliant;
  final StockPriceEntity price;

  const StockEntity({
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
