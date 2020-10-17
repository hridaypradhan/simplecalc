import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:simple_calc/utilities/currency.dart';
import 'package:http/http.dart' as http;

class CurrencyData extends ChangeNotifier {
  CurrencyData() {
    getOnlineCurrencyData();
  }

  double _currencyAmount1 = 1.0,
      _currencyAmount2 = 72.0,
      _conversionRate = 72.0;

  int _currencyIndex1 = 50, _currencyIndex2 = 15;

  Currency _currentCurrency1 = _currencies[0],
      _currentCurrency2 = _currencies[1];

  String _url =
      'https://free.currconv.com/api/v7/currencies?apiKey=f964338e4204cb7e3838';

  http.Response response;

  static final List<Currency> _currencies = [
    Currency('USD', 'U.S. Dollar', '\$'),
    Currency('INR', 'Indian Rupee', '₹'),
  ];

  final List<Text> _currenciesAsWidgets = [
    Text('U.S. dollar : USD'),
    Text('Indian rupee : INR'),
  ];

  void getOnlineCurrencyData() async {
    response = await http.get(_url);

    Map map = jsonDecode(response.body)['results'];

    _currencies.clear();
    _currenciesAsWidgets.clear();

    map.entries.forEach((e) {
      try {
        _currencies.add(Currency(
            e.value['id'], e.value['currencyName'], e.value['currencySymbol']));
      } catch (f) {
        _currencies.add(
            Currency(e.value['id'], e.value['currencyName'], e.value['id']));
      }

      _currenciesAsWidgets
          .add(Text('${e.value['currencyName']} : ${e.value['id']}'));
    });
  }

  void updateAmount2() {
    _currencyAmount2 = _conversionRate * _currencyAmount1;
  }

  void swapCurrencies() {
    Currency temp1 = _currentCurrency1;
    _currentCurrency1 = _currentCurrency2;
    _currentCurrency2 = temp1;

    updateCurrencyIndex1();
    updateCurrencyIndex2();

    double temp2 = _currencyAmount1;
    _currencyAmount1 = _currencyAmount2;
    _currencyAmount2 = temp2;

    _conversionRate = 1 / _conversionRate;

    _currencies.clear();
    _currenciesAsWidgets.clear();

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
    updateAmount2();
    notifyListeners();
  }

  void changeCurrencyAmount2(String newValue) {
    _currencyAmount2 = double.parse(newValue);
    notifyListeners();
  }

  Currency currency(int index) => _currencies[index];

  Currency get currentCurrency1 => _currentCurrency1;

  Currency get currentCurrency2 => _currentCurrency2;

  List<Text> get currenciesAsWidgets => _currenciesAsWidgets;

  double get currencyAmount1 => _currencyAmount1;

  double get currencyAmount2 => _currencyAmount2;

  int get currencyIndex1 => _currencyIndex1;

  int get currencyIndex2 => _currencyIndex2;
}
