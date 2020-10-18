import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/utilities/currency_data.dart';

class CurrencyChanger extends StatelessWidget {
  final int cardNumber;

  CurrencyChanger({@required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    FixedExtentScrollController _fixedExtentScrollController =
        FixedExtentScrollController(
      initialItem: cardNumber == 1
          ? Provider.of<CurrencyData>(context).currencyIndex1
          : Provider.of<CurrencyData>(context).currencyIndex2,
    );
    return Container(
      height: 200.0,
      color: Colors.black,
      child: Container(
        child: CupertinoPicker(
          scrollController: _fixedExtentScrollController,
          itemExtent: 45.0,
          onSelectedItemChanged: (int selectedIndex) {
            cardNumber == 1
                ? Provider.of<CurrencyData>(context, listen: false)
                    .changeCurrency1(selectedIndex)
                : Provider.of<CurrencyData>(context, listen: false)
                    .changeCurrency2(selectedIndex);
          },
          children: Provider.of<CurrencyData>(context).currenciesAsWidgets,
        ),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
