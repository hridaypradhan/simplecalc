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
                    currency: Provider.of<CurrencyData>(context).currency1,
                    flex: 4,
                    changeAmount: (String newValue) {
                      Provider.of<CurrencyData>(context)
                          .changeCurrencyAmount1(newValue);
                    },
                    cardNumber: 1,
                  ),
                  Flexible(
                    flex: 2,
                    child: IconButton(
                      icon: Icon(
                        Icons.compare_arrows,
                        size: 40.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Provider.of<CurrencyData>(context, listen: false)
                            .swapCurrencies();
                      },
                    ),
                  ),
                  CurrencyCard(
                    currency: Provider.of<CurrencyData>(context).currency2,
                    changeAmount: (String newValue) {
                      Provider.of<CurrencyData>(context)
                          .changeCurrencyAmount2(newValue);
                    },
                    flex: 4,
                    cardNumber: 2,
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
