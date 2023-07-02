import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePurchaseWidget extends StatelessWidget {
  final String date;

  const DatePurchaseWidget({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    DateTime dateTime = DateTime.parse(date);
    String dayConverted = '${dateTime.day}';

    String day = dayConverted.length < 2 ? '0$dayConverted' : dayConverted;
    String monthName = DateFormat('MMMM', 'pt_BR').format(dateTime);

    return Container(
      height: screenHeight * 0.10,
      width: screenWidth * 0.25,
      color: Colors.grey[200],
      child: Center(
        child: Text(
          '$day ${monthName.substring(0, 3)}',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
