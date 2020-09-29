import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/utilities/bmi_data.dart';
import 'package:simple_calc/utilities/constants.dart';

class AttributeCard extends StatelessWidget {
  final int maxValue, minValue;
  final String name, units;
  final Function sliderFunction;

  AttributeCard(
      {@required this.minValue,
      @required this.maxValue,
      @required this.name,
      @required this.units,
      @required this.sliderFunction});

  @override
  Widget build(BuildContext context) {
    return Consumer<BMIData>(
      builder: (context, bmiData, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '   $name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 315.0,
              ),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        units == 'cm'
                            ? bmiData.getHeight().toString()
                            : bmiData.getWeight().toString(),
                        style: TextStyle(
                          color: themeColor,
                          fontSize: 25.0,
                        ),
                      ),
                      Text(
                        '${units.toLowerCase()}',
                        style: TextStyle(
                          color: themeColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      CupertinoSlider(
                        activeColor: themeColor,
                        max: maxValue.toDouble(),
                        min: minValue.toDouble(),
                        value: units == 'cm'
                            ? bmiData.getHeight().toDouble()
                            : bmiData.getWeight().toDouble(),
                        onChanged: (double value) {
                          sliderFunction(value);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
