import 'package:flutter/material.dart';
import 'package:simple_calc/currency_layout_units/currency_card.dart';
import 'package:simple_calc/utilities/constants.dart';
import 'package:simple_calc/utilities/page_head.dart';

class CurrencyScreen extends StatelessWidget {
  static final String id = 'currency_screen';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: themeColor,
        child: Column(
          children: <Widget>[
            PageHead(
              image: 'images/currency.png',
              heading: 'Currency Converter',
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CurrencyCard(),
                CurrencyCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

