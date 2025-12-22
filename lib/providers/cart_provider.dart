import 'package:flutter/material.dart';

// Provider widget is just a wrapper around Inherited Widget
// which make it easy to use
// used for state management by saving data to a global place
// sets a value globally which can be used anywhere in the project

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}

// Types of Provider :-
// a) Provider
// =====> read-only value
// b) ChangeNotifierProvider
// =====> change value and notify widgets listening to it
// c) FutureProvider
// =====> listen to Future, subscribe to them & show the changes
// d) StreamProvider
// =====> provides Stream
