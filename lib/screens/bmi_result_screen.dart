import 'package:flutter/material.dart';
import 'package:simple_calc/bmi_layout_units/result_card.dart';
import 'package:simple_calc/utilities/constants.dart';

class BMIResultScreen extends StatelessWidget {
  static final String id = "bmi_result_screen";
  final String bmi;

  BMIResultScreen({this.bmi});

  Text generateMessage(String bmi) {
    double bmiValue = double.parse(bmi);
    String category;
    if (bmiValue <= 18.5)
      category = underweightText;
    else if (bmiValue <= 25)
      category = normalText;
    else if (bmiValue <= 30)
      category = overweightText;
    else
      category = obeseText;
    return Text(
      'Your BMI is $bmi, which indicates that you are in the ${category.toUpperCase()} category.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Result',
              style: TextStyle(
                letterSpacing: 0.7,
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            ResultCard(
              bmi: bmi,
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: 300.0,
              child: generateMessage(bmi),
            ),
          ],
        ),
      ),
    );
  }
}
