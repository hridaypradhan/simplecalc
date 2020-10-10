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
            Flexible(
              flex: 2,
              child: PageHead(
                image: 'images/currency.png',
                heading: 'Currency Converter',
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CurrencyCard(flex: 2),
                  Flexible(
                    flex: 1,
                    child: Icon(
                      Icons.compare_arrows,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                  CurrencyCard(flex: 2),
                ],
              ),
            ),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
