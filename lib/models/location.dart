import 'dart:io'; 

class LocationData {
  final double latitude;
  final double longitude;
  final String address;

  const LocationData({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}

class Location {
  final String id;
  final String title;
  final LocationData location;
  final File photo;

  const Location({
    required this.id,
    required this.title,
    required this.location,
    required this.photo,
  });
}