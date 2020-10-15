import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calc/utilities/currency_data.dart';

ChangeNotifierProvider<CurrencyData> myNotifier;

// blue[200], red[400]
final Color themeColor = Colors.black;

const title = 'Simple Calc';
const overweightText = 'overweight';
const normalText = 'normal';
const underweightText = 'underweight';
const obeseText = 'obese';

final Color selectedColor = Colors.grey[400];
