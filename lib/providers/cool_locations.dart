import 'package:flutter/material.dart';
import 'package:flutter_nativeresources/models/location.dart';

class CoolLocations with ChangeNotifier {
  List<Location> _items = [];

  List<Location> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Location getItem(int index) {
    return _items[index];
  }
}