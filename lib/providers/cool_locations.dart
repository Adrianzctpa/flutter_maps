import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nativeresources/utils/db_util.dart';
import 'package:flutter_nativeresources/utils/location_util.dart';
import 'package:flutter_nativeresources/models/location.dart';

class CoolLocations with ChangeNotifier {
  List<Location> _items = [];

  Future<void> loadLocations() async {
    final dataList = await DBUtil().getData('coolLocations');
    _items = dataList.map(
      (i) => Location(
        id: i['id'],
        title: i['title'],
        location: LocationData(
          latitude: i['lat'],
          longitude: i['lng'],
          address: i['address'],
        ),
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

  Future<void> addLocation(String title, File img, LatLng pos) async {
    String address = await LocationUtil.getAddressFrom(pos);
    
    final loc = Location(
      id: DateTime.now().toString(),
      title: title,
      location: LocationData(
        latitude: pos.latitude,
        longitude: pos.longitude,
        address: address,
      ),
      photo: img,
    );

    _items.add(loc);

    DBUtil().insert(
      'coolLocations',
      {
        'id': loc.id,
        'title': loc.title,
        'image': loc.photo.path,
        'lat': pos.latitude,
        'lng': pos.longitude,
        'address': address
      },
    );
    notifyListeners();
  } 
}