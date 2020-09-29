import 'package:flutter/material.dart';

class PageHead extends StatelessWidget {
  final String image, heading;

  PageHead({@required this.image, @required this.heading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 50.0),
          height: 150.0,
          child: Image.asset(
            '$image',
          ),
        ),
        Text(
          '$heading',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 50.0,
            letterSpacing: 3.0,
          ),
        ),
        // Divider(
        //   color: Colors.white,
        //   height: 20.0,
        // ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
