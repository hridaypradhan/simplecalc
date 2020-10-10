import 'package:flutter/material.dart';
import 'package:simple_calc/utilities/constants.dart';

class CurrencyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('USD'),
              Icon(
                Icons.arrow_right,
              )
            ],
          ),
          TextField(
            style: TextStyle(
              fontSize: 30.0,
            ),
            cursorColor: themeColor,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: themeColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
