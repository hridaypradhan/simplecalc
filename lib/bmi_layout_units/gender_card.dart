import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final IconData symbol;
  final String label;
  final bgColor;

  GenderCard({@required this.symbol, this.label, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: bgColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              symbol,
              color: Colors.black,
              size: 30.0,
            ),
            Text(
              '$label',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
