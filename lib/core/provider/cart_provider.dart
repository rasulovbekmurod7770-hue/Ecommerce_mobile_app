import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  int _productCount = 1;
  double _priceOfJacket = 198;
  double _shippingCost = 8.00;
  double _tax = 0;

  int get productCount => _productCount;
  double get priceOfJacket => _priceOfJacket;

  double get shippingCost => _shippingCost;
  double get tax => _tax;

  double get subtotal => _priceOfJacket;
  double get total => subtotal + _shippingCost + _tax;

  void addButton() {
    _productCount++;
    _priceOfJacket *= 2;
    notifyListeners();
  }

  void minusButton() {
    _productCount--;
    _priceOfJacket /= 2;
    notifyListeners();
  }
}
