import 'package:flutter/material.dart';
import 'package:wallet_track/src/common_widgets/common_price_text.dart';

class PricePurchaseWidget extends StatelessWidget {
  final String price;

  const PricePurchaseWidget({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: screenHeight * 0.10,
      width: screenWidth * 0.75,
      child: Container(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
        ),
        child: Row(
          children: [
            const Text(
              'Pagamento',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            Expanded(child: Container()),
            const Text(
              'R\$',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            CommonPriceText(
              priceHasDollarSign: false,
              price: price,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
