import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/utilities/currency_data.dart';

class CurrencyChanger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.black,
      child: Container(
        child: CupertinoPicker(
          itemExtent: 32.0,
          onSelectedItemChanged: (selectedIndex) {
            Provider.of<CurrencyData>(context, listen: false)
                .changeCurrency1(selectedIndex);
          },
          children: Provider.of<CurrencyData>(context).currencyListAsWidgets,
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
