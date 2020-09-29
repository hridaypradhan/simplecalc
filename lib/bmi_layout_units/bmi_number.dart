import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/utilities/bmi_data.dart';

class BMINumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Current BMI',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            Provider.of<BMIData>(context, listen: false).getBmi(),
            style: TextStyle(
              color:
                  Provider.of<BMIData>(context, listen: false).getBmiColour(),
              fontSize: 45.0,
            ),
          ),
        ],
      ),
    );
  }
}
