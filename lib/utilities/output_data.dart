import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';
import 'constants.dart';

class OutputData extends ChangeNotifier {
  String _toDisplay = title;

  void backspace() {
    _toDisplay = _toDisplay.substring(0, _toDisplay.length - 1);
    if (_toDisplay == '') _toDisplay = title;
    notifyListeners();
  }

  void changeOutput(String toShow) {
    if (_toDisplay == title) {
      _toDisplay = '';
    }

    _toDisplay += toShow;
    notifyListeners();
  }

  void clear() {
    _toDisplay = title;
    notifyListeners();
  }

  String get displayString {
    return _toDisplay;
  }

  void calculate() {
    Expression exp = Parser().parse(_toDisplay);
    ContextModel cm = ContextModel();
    cm.bindVariableName('π', Number(3.14));

    clear();

    double answer = exp.evaluate(EvaluationType.REAL, cm);
    changeOutput(
        (answer % 100000 == 0) ? answer.toStringAsFixed(5) : answer.toString());
  }
}
