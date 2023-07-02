import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonPriceText extends StatelessWidget {
  final String price;
  final bool priceHasDollarSign;
  final TextStyle? style;

  const CommonPriceText({
    super.key,
    required this.price,
    required this.priceHasDollarSign,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    double priceConverted = double.parse(price);
    NumberFormat formatter = NumberFormat.currency(locale: 'pt_BR', symbol: '');
    String formattedPrice = formatter.format(priceConverted);

    return Text(
      priceHasDollarSign == true ? 'R\$ $formattedPrice' : formattedPrice,
      style: style,
    );
  }
}
