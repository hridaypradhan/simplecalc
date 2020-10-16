import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/utilities/constants.dart';
import 'package:simple_calc/utilities/currency.dart';
import 'package:simple_calc/utilities/currency_data.dart';
import 'currency_changer.dart';

class CurrencyCard extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  final int flex, cardNumber;
  final Currency currency;

  CurrencyCard({this.flex, @required this.currency, @required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    textEditingController.text = cardNumber == 1
        ? Provider.of<CurrencyData>(context).currencyAmount1.toString()
        : Provider.of<CurrencyData>(context).currencyAmount2.toString();

    textEditingController.selection =
        TextSelection.collapsed(offset: textEditingController.text.length);

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
                  builder: (context) => CurrencyChanger(
                    cardNumber: cardNumber,
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
                          fontWeight: FontWeight.w400,
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
                    controller: textEditingController,
                    onEditingComplete: () {
                      cardNumber == 1
                          ? Provider.of<CurrencyData>(context, listen: false)
                              .changeCurrencyAmount1(textEditingController.text)
                          : Provider.of<CurrencyData>(context, listen: false)
                              .changeCurrencyAmount2(
                                  textEditingController.text);
                    },
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
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
