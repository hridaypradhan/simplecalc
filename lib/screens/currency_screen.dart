import 'package:flutter/material.dart';
import 'file:///C:/Users/hrida/Documents/Flutter%20Learning/simple_calc/lib/utilities/page_head.dart';
import 'package:simple_calc/utilities/constants.dart';

class CurrencyScreen extends StatelessWidget {
  static final String id = 'currency_screen';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: themeColor,
        child: PageHead(
          image: 'images/currency.png',
          heading: 'Currency Converter',
        ),
      ),
    );
  }
}
