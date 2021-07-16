import 'package:flutter/material.dart';

class productinfo {
  String barcode;
  String name;
  double price;
  int quantity;
  productinfo(this.barcode, this.name, this.price, this.quantity);
}

class Cart with ChangeNotifier {
  Map<String, productinfo> _items = {};
  Map<String, productinfo> get items {
    return {..._items};
  }
  int get itemCount {
    return _items.length;
  }


  void addItem(String barcode, String name, double price,) {
    if (_items.containsKey(barcode)) {
      _items.update(
          barcode,
              (existitm) => productinfo(existitm.barcode, existitm.name,
              existitm.price, existitm.quantity + 1));
    } else {
      _items.putIfAbsent(barcode, () => productinfo(barcode, name, price, 1));
    }
    notifyListeners();
  }

  void removeitem(
      String barcode,
      ) {
    _items.remove(barcode);
  }

  void removesingitem(String barcode, ) {
    if (_items[barcode]!.quantity > 1) {
      _items.update(
          barcode,
              (existitm) => productinfo(barcode, existitm.name, existitm.price,
              existitm.quantity - 1));
    }
    notifyListeners();
  }

  void cler() {
    _items = {};
    notifyListeners();
  }
}
