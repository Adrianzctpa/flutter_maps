import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_nativeresources/utils/db_util.dart';
import 'package:flutter_nativeresources/models/location.dart';

class CoolLocations with ChangeNotifier {
  List<Location> _items = [];

  Future<void> loadLocations() async {
    final dataList = await DBUtil().getData('coolLocations');
    _items = dataList.map(
      (i) => Location(
        id: i['id'],
        title: i['title'],
        location: null,
        photo: File(i['image']),
      )
    ).toList();
    notifyListeners();
  }

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
      location: null,
      photo: img,
    );

    _items.add(loc);

    DBUtil().insert(
      'coolLocations',
      {
        'id': loc.id,
        'title': loc.title,
        'image': loc.photo.path,
      },
    );
    notifyListeners();
  } 
}