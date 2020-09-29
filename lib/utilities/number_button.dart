import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/utilities/output_data.dart';
import 'constants.dart';

class NumberButton extends StatefulWidget {
  final String text;
  final Function onTap;
  NumberButton({@required this.text, this.onTap});

  @override
  _NumberButtonState createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OutputData>(
      builder: (context, outputData, child) {
        return FlatButton(
          onPressed: widget.onTap == null
              ? () {
                  Provider.of<OutputData>(context, listen: false)
                      .changeOutput(widget.text);
                }
              : widget.onTap,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30.0,
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
                color: themeColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
