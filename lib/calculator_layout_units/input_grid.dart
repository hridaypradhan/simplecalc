import 'package:flutter/material.dart';
import 'package:simple_calc/utilities/bmi_data.dart';
import 'package:simple_calc/utilities/number_button.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/screens/navigation_drawer.dart';
import '../utilities/output_data.dart';

class InputGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(
                  text: 'C',
                  onTap: () {
                    Provider.of<OutputData>(context, listen: false).clear();
                  },
                ),
                NumberButton(text: '^'),
                NumberButton(text: 'π'),
                NumberButton(text: '/'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(text: '7'),
                NumberButton(text: '8'),
                NumberButton(text: '9'),
                NumberButton(text: '*'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(text: '4'),
                NumberButton(text: '5'),
                NumberButton(text: '6'),
                NumberButton(text: '-'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(text: '1'),
                NumberButton(text: '2'),
                NumberButton(text: '3'),
                NumberButton(text: '+'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(
                  text: '->',
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => NavigationDrawer(),
                    );
                  },
                ),
                NumberButton(text: '0'),
                NumberButton(text: '.'),
                NumberButton(
                  text: '=',
                  onTap: () {
                    Provider.of<OutputData>(context, listen: false).calculate();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
