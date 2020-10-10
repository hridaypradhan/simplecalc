import 'package:flutter/material.dart';
import 'package:simple_calc/utilities/constants.dart';

class CurrencyCard extends StatelessWidget {
  final int flex;

  CurrencyCard({this.flex});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'USD',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 20.0,
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  size: 30.0,
                )
              ],
            ),
            TextField(
              autofocus: true,
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
          ],
        ),
      ),
    );
  }
}
