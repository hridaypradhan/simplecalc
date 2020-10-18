import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:simple_calc/utilities/currency.dart';
import 'package:http/http.dart' as http;

class CurrencyData extends ChangeNotifier {
  CurrencyData() {
    getOnlineCurrencyData();
  }

  double _currencyAmount1 = 1.0,
      _currencyAmount2 = 73.44304,
      _conversionRate = 73.44304;

  int _currencyIndex1 = 156, _currencyIndex2 = 66;

  Currency _currentCurrency1 = _currencies[0],
      _currentCurrency2 = _currencies[1];

  String _currencyTextInfoUrl =
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
    response = await http.get(_currencyTextInfoUrl);

    Map map = jsonDecode(response.body)['results'];

    _currencies.clear();
    _currenciesAsWidgets.clear();

    map.entries.forEach(
      (entry) {
        if (entry.value['currencySymbol'] != null) {
          _currencies.add(
            Currency(
              entry.value['id'],
              entry.value['currencyName'],
              entry.value['currencySymbol'],
            ),
          );
        } else {
          _currencies.add(
            Currency(
              entry.value['id'],
              entry.value['currencyName'],
              entry.value['id'],
            ),
          );
        }
      },
    );

    _currencies.sort();
    for (var currency in _currencies)
      _currenciesAsWidgets.add(
        Text('${currency.name} : ${currency.shortForm}'),
      );
  }

  void updateAmount2() {
    _currencyAmount2 = _conversionRate * _currencyAmount1;
  }

  void updateAmount1() {
    _currencyAmount1 = _currencyAmount2 / _conversionRate;
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
    updateConversionRate();
    notifyListeners();
  }

  void changeCurrency2(int index) {
    _currentCurrency2 = _currencies[index];
    updateCurrencyIndex2();
    updateConversionRate();
    notifyListeners();
  }

  void updateConversionRate() async {
    http.Response rateResponse =
        await http.get('https://free.currconv.com/api/v7/convert?q='
            '${_currentCurrency1.shortForm}_${_currentCurrency2.shortForm}'
            '&compact=ultra&apiKey=f964338e4204cb7e3838');
    _currencyAmount2 = _currencyAmount1 *
        jsonDecode(rateResponse.body)[
            '${_currentCurrency1.shortForm}_${_currentCurrency2.shortForm}'];
    notifyListeners();
  }

  void changeCurrencyAmount1(String newValue) {
    _currencyAmount1 = double.parse(newValue);
    updateAmount2();
    notifyListeners();
  }

  void changeCurrencyAmount2(String newValue) {
    _currencyAmount2 = double.parse(newValue);
    updateAmount1();
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
