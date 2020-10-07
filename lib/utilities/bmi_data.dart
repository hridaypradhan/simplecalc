import 'dart:math';
import 'package:flutter/material.dart';
import 'constants.dart';

class BMIData extends ChangeNotifier {
  int _height = 120, _weight = 40;
  Color _maleBgColor = Colors.white, _femaleBgColor = Colors.white, _bmiColour;
  double _bmi;

  void calculateBmi() {
    _bmi = _weight / pow(_height / 100, 2);
  }

  void changeHeight(double newHeight) {
    _height = newHeight.round();
    calculateBmi();
    notifyListeners();
  }

  void changeWeight(double newWeight) {
    _weight = newWeight.round();
    calculateBmi();
    notifyListeners();
  }

  void changeMaleBgColour() {
    _maleBgColor = _maleBgColor == selectedColor ? Colors.white : selectedColor;
    _femaleBgColor = Colors.white;
    notifyListeners();
  }

  void changeFemaleBgColour() {
    _femaleBgColor =
        _femaleBgColor == selectedColor ? Colors.white : selectedColor;
    _maleBgColor = Colors.white;
    notifyListeners();
  }

  void decideBmiColor() {
    if (_bmi <= 18.5)
      _bmiColour = Colors.blue;
    else if (_bmi <= 25)
      _bmiColour = Colors.green;
    else if (_bmi <= 30)
      _bmiColour = Colors.red;
    else
      _bmiColour = Colors.red[900];
  }

  int getHeight() => _height;

  int getWeight() => _weight;

  Color getBmiColour() => _bmiColour;

  Color getMaleBgColour() => _maleBgColor;

  Color getFemaleBgColour() => _femaleBgColor;

  String getBmi() {
    calculateBmi();
    decideBmiColor();
    return _bmi.toStringAsFixed(1);
  }
}
