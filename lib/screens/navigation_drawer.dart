import 'package:flutter/material.dart';
import 'package:simple_calc/screens/bmi_input_screen.dart';
import 'package:simple_calc/screens/currency_screen.dart';
import 'package:simple_calc/utilities/navigation_button.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Color(0xff757575),
      child: Container(
        child: Row(
          children: <Widget>[
            NavigationButton(
              whereToGo: BMIInputScreen.id,
              title: 'BMI Calculator',
              image: 'images/bmi.png',
            ),
            NavigationButton(
              whereToGo: CurrencyScreen.id,
              title: 'Currency Converter',
              image: 'images/currency.png',
            ),
          ],
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
