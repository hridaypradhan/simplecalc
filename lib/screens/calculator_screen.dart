import 'package:flutter/material.dart';
import 'package:simple_calc/calculator_layout_units/backspace_button.dart';
import 'package:simple_calc/calculator_layout_units/input_grid.dart';
import 'package:simple_calc/calculator_layout_units/output.dart';
import 'package:simple_calc/utilities/constants.dart';

class CalculatorScreen extends StatelessWidget {
  static final String id = 'calculator_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0.0,
      ),
      backgroundColor: themeColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Output(),
            ),
            BackspaceButton(),
            Divider(
              color: Colors.white,
              thickness: 5.0,
            ),
            InputGrid(),
          ],
        ),
      ),
    );
  }
}
