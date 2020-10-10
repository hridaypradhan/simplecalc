import 'package:flutter/material.dart';

class PageHead extends StatelessWidget {
  final String image, heading;

  PageHead({@required this.image, @required this.heading});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              height: 100.0,
              child: Image.asset(
                '$image',
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(
              '$heading',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 40.0,
                letterSpacing: 3.0,
              ),
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
      ),
    );
  }
}
