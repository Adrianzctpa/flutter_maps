import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_nativeresources/models/location.dart';

class CoolLocations with ChangeNotifier {
  final List<Location> _items = [];

  List<Location> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Location getItem(int index) {
    return _items[index];
  }

  void addLocation(String title, File img) {
    final loc = Location(
      id: DateTime.now().toString(),
      title: title,
      location: const LocationData(
        latitude: 0,
        longitude: 0,
        address: '',
      ),
      photo: img,
    );

    _items.add(loc);
    notifyListeners();
  } 
}