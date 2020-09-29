import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/screens/bmi_input_screen.dart';
import 'package:simple_calc/screens/bmi_result_screen.dart';
import 'package:simple_calc/screens/calculator_screen.dart';
import 'package:flutter/services.dart';
import 'package:simple_calc/screens/currency_screen.dart';
import 'package:simple_calc/utilities/bmi_data.dart';
import 'package:simple_calc/utilities/output_data.dart';

void main() {
  runApp(Calc());
}

class Calc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    return MaterialApp(
      initialRoute: CalculatorScreen.id,
      routes: {
        CalculatorScreen.id: (context) => ChangeNotifierProvider(
              create: (context) => OutputData(),
              child: CalculatorScreen(),
            ),
        BMIInputScreen.id: (context) => ChangeNotifierProvider(
              create: (context) => BMIData(),
              child: BMIInputScreen(),
            ),
        BMIResultScreen.id: (context) => BMIResultScreen(),
        CurrencyScreen.id: (context) => CurrencyScreen(),
      },
    );
  }
}
