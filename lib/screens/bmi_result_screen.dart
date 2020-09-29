import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  static final String id = "bmi_result_screen";

  final String bmi;

  BMIResultScreen({this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Text(
              bmi,
              style: TextStyle(
                fontSize: 120.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
