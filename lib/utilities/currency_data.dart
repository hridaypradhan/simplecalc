import 'package:flutter/material.dart';
import 'package:simple_calc/utilities/currency.dart';

class CurrencyData extends ChangeNotifier {
  double _currencyAmount1 = 1, _currencyAmount2 = 1;
  Currency _currentCurrency1 = _currencies[0],
      _currentCurrency2 = _currencies[1];

  static final List<Currency> _currencies = [
    Currency('USD', 'United States Dollar', '\$'),
    Currency('INR', 'Indian Rupee', 'Rs'),
  ];

  static final List<Text> _currenciesAsWidgets = [
    Text('USD'),
    Text('INR'),
  ];

  void changeCurrency1(int index) {
    print(_currentCurrency1.shortForm);
    _currentCurrency1 = _currencies[index];
    print(_currentCurrency1.shortForm);
    notifyListeners();
  }

  void changeCurrency2(int index) {
    _currentCurrency2 = _currencies[index];
    notifyListeners();
  }

  void changeCurrencyAmount1(String newValue) {
    _currencyAmount1 = double.parse(newValue);
    notifyListeners();
  }

  void changeCurrencyAmount2(String newValue) {
    _currencyAmount2 = double.parse(newValue);
    notifyListeners();
  }

  Currency get currency1 => _currentCurrency1;
  Currency get currency2 => _currentCurrency2;

  List<Text> get currencyListAsWidgets => _currenciesAsWidgets;

  double get amount1 => _currencyAmount1;
  double get amount2 => _currencyAmount2;
}
