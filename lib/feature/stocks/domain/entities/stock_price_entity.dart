import 'package:equatable/equatable.dart';

class StockPriceEntity extends Equatable {
  final double price;
  final double changePercent;

  const StockPriceEntity({
    required this.price,
    required this.changePercent,
  });

  @override
  List<Object?> get props => [price, changePercent];
}
