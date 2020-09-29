import 'package:flutter/material.dart';

import 'constants.dart';

class NavigationButton extends StatelessWidget {
  final String whereToGo, title, image;

  NavigationButton(
      {@required this.whereToGo, @required this.title, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, whereToGo);
        },
        child: Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: themeColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Image.asset(
                  '$image',
                ),
                height: 60.0,
              ),
              Center(
                child: Text(
                  '$title',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
