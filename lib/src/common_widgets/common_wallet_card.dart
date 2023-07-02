import 'package:flutter/material.dart';
import 'package:wallet_track/src/common_widgets/common_padding.dart';
import 'package:wallet_track/src/common_widgets/common_price_text.dart';

class CommonWalletCard extends StatelessWidget {
  final String cardClientName;
  final String cardNumber;

  const CommonWalletCard({
    super.key,
    required this.cardClientName,
    required this.cardNumber,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Center(
      child: Card(
        elevation: 1,
        color: const Color(0xFF240D4E),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          width: screenHeight * 0.42,
          height: screenWidth * 0.62,
          child: Center(
            child: Column(
              children: [
                const Image(
                  height: 80.0,
                  width: 80.0,
                  image: AssetImage('assets/logo/mastercard-logo.png'),
                ),
                const Text(
                  'mastercard',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12.0),
                Text(
                  cardClientName,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 2.0),
                Text(
                  'XXXX XXXX XXXX ${cardNumber.substring(cardNumber.length - 4)}',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12.0),
                CommonPadding(
                  padding: const EdgeInsets.only(
                    left: 28.0,
                    right: 28.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Gasto',
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(child: Container()),
                          const CommonPriceText(
                            priceHasDollarSign: true,
                            price: '2000',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          const Text(
                            'Disponivel',
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(child: Container()),
                          const CommonPriceText(
                            priceHasDollarSign: true,
                            price: '500',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
