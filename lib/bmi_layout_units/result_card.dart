import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String bmi;

  ResultCard({@required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Your current BMI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          Text(
            bmi,
            style: TextStyle(
              fontSize: 110.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
