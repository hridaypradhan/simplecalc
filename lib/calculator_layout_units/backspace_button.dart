import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utilities/output_data.dart';

class BackspaceButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      icon: Icon(Icons.backspace),
      onPressed: () {
        Provider.of<OutputData>(context, listen: false).backspace();
      },
    );
  }
}
