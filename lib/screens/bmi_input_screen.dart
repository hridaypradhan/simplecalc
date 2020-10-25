import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/bmi_layout_units/attribute_card.dart';
import 'package:simple_calc/bmi_layout_units/bmi_number.dart';
import 'package:simple_calc/bmi_layout_units/gender_card.dart';
import 'package:simple_calc/screens/bmi_result_screen.dart';
import 'package:simple_calc/utilities/bmi_data.dart';
import 'package:simple_calc/utilities/constants.dart';
import '../utilities/page_head.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMIInputScreen extends StatelessWidget {
  static final String id = 'bmi_input_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<BMIData>(
      builder: (context, bmiData, child) {
        return Material(
          color: themeColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PageHead(
                image: 'images/bmi.png',
                heading: 'BMI Calc',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      bmiData.changeMaleBgColour();
                    },
                    child: GenderCard(
                      bgColor: bmiData.getMaleBgColour(),
                      symbol: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      bmiData.changeFemaleBgColour();
                    },
                    child: GenderCard(
                      bgColor: bmiData.getFemaleBgColour(),
                      symbol: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              AttributeCard(
                maxValue: 210,
                minValue: 100,
                name: 'Height',
                units: 'cm',
                sliderFunction: (double value) {
                  bmiData.changeHeight(value);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              AttributeCard(
                maxValue: 100,
                minValue: 20,
                name: 'Weight',
                units: 'kg',
                sliderFunction: (double value) {
                  bmiData.changeWeight(value);
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              BMINumber(),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResultScreen(
                        bmi: bmiData.getBmi(),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 315.0,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'MORE INFO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
