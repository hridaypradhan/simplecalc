import 'package:flutter/material.dart';
import 'package:simple_calc/utilities/currency.dart';

class CurrencyData extends ChangeNotifier {
  double _currencyAmount1 = 1, _currencyAmount2 = 1;

  int _currencyIndex1 = 0, _currencyIndex2 = 1;

  Currency _currentCurrency1 = _currencies[0],
      _currentCurrency2 = _currencies[1];

  static final List<Currency> _currencies = [
    Currency('USD', 'United States Dollar', '\$'),
    Currency('INR', 'Indian Rupee', 'Rs'),
  ];

  final List<Text> _currenciesAsWidgets = [
    Text('USD'),
    Text('INR'),
  ];

  void swapCurrencies() {
    Currency temp = _currentCurrency1;
    _currentCurrency1 = _currentCurrency2;
    _currentCurrency2 = temp;
    updateCurrencyIndex1();
    updateCurrencyIndex2();
    notifyListeners();
  }

  void updateCurrencyIndex1() {
    _currencyIndex1 = _currencies.indexOf(_currentCurrency1);
    notifyListeners();
  }

  void updateCurrencyIndex2() {
    _currencyIndex2 = _currencies.indexOf(_currentCurrency2);
    notifyListeners();
  }

  void changeCurrency1(int index) {
    _currentCurrency1 = _currencies[index];
    updateCurrencyIndex1();
    notifyListeners();
  }

  void changeCurrency2(int index) {
    _currentCurrency2 = _currencies[index];
    updateCurrencyIndex2();
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

  Currency currency(int index) => _currencies[index];

  Currency get currency1 => _currentCurrency1;

  Currency get currency2 => _currentCurrency2;

  List<Text> get currencyListAsWidgets => _currenciesAsWidgets;

  double get amount1 => _currencyAmount1;

  double get amount2 => _currencyAmount2;

  int get currencyIndex1 => _currencyIndex1;

  int get currencyIndex2 => _currencyIndex2;
}
