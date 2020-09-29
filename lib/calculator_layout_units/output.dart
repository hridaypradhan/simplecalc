import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/utilities/output_data.dart';
import '../utilities/constants.dart';

class Output extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OutputData>(builder: (context, outputData, child) {
      return Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.white,
          child: Text(
            '${Provider.of<OutputData>(context).displayString}',
            style: TextStyle(
              letterSpacing: 5.0,
              fontSize: 45.0,
              color: themeColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    });
  }
}
