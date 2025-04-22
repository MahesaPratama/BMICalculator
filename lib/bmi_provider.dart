import 'package:flutter/material.dart';

class BmiProvider extends ChangeNotifier {
  double _weight = 0.0;
  double _height = 0.0;
  double _bmi = 0.0;

  double get weight => _weight;
  double get height => _height;
  double get bmi => _bmi;

  void setWeight(double weight) {
    _weight = weight;
    notifyListeners();
  }

  void setHeight(double height) {
    _height = height;
    notifyListeners();
  }

  void calculateBmi() {
    if (_height > 0) {
      _bmi = _weight / ((_height / 100) * (_height / 100));
      notifyListeners();
    }
  }
}