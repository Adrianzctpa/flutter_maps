import 'dart:io'; 
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationData {
  final double latitude;
  final double longitude;
  final String? address;

  const LocationData({
    required this.latitude,
    required this.longitude,
    this.address,
  });

  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }
}

class Location {
  final String id;
  final String title;
  final LocationData? location;
  final File photo;

  const Location({
    required this.id,
    required this.title,
    required this.location,
    required this.photo,
  });
}