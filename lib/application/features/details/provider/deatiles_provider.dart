import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeatilesProvider extends ChangeNotifier {
  int product_count = 0;

  incriment() {
    if (product_count < 12) {
      product_count++;
    }
    notifyListeners();
  }

  decriment() {
    if (product_count > 0) {
      product_count--;
    }
    notifyListeners();
  }
}
