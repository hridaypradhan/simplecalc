import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/currency_layout_units/currency_card.dart';
import 'package:simple_calc/utilities/constants.dart';
import 'package:simple_calc/utilities/currency_data.dart';
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
            SizedBox(
              height: 10.0,
            ),
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
                    CurrencyCard(
                      currency:
                          Provider.of<CurrencyData>(context, listen: false)
                              .currency1,
                      flex: 4,
                      changeAmount: (String newValue) {
                        Provider.of<CurrencyData>(context, listen: false)
                            .changeCurrencyAmount1(newValue);
                      },
                    ),
                    Flexible(
                      flex: 2,
                      child: Icon(
                        Icons.compare_arrows,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                    CurrencyCard(
                      currency:
                          Provider.of<CurrencyData>(context, listen: false)
                              .currency2,
                      changeAmount: (String newValue) {
                        Provider.of<CurrencyData>(context, listen: false)
                            .changeCurrencyAmount2(newValue);
                      },
                      flex: 4,
                    ),
                  ],
                )),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
