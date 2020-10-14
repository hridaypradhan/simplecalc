import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/utilities/constants.dart';
import 'package:simple_calc/utilities/currency.dart';
import 'package:simple_calc/utilities/currency_data.dart';
import 'currency_changer.dart';

class CurrencyCard extends StatelessWidget {
  final int flex;
  final Function changeAmount;
  final Currency currency;

  CurrencyCard(
      {this.flex, @required this.changeAmount, @required this.currency});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => ChangeNotifierProvider(
                    create: (context) => CurrencyData(),
                    child: CurrencyChanger(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        currency.shortForm,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        currency.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_right,
                    size: 30.0,
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    onChanged: changeAmount,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                    cursorColor: themeColor,
                    decoration: InputDecoration(
                      hintText: 'Enter an amount',
                      hintStyle: TextStyle(fontSize: 20.0),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: themeColor),
                      ),
                    ),
                  ),
                ),
                Text(
                  currency.symbol,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
