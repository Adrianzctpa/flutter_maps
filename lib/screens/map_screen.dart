import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_nativeresources/models/location.dart';

class MapScreen extends StatefulWidget {
  final LocationData initialLocation;
  final bool isReadOnly;

  const MapScreen({
    this.initialLocation = const LocationData(
      latitude: 37.422131,
      longitude: -122.084801, 
      address: 'Google Headquarters',
    ),
    this.isReadOnly = false,
    Key? key, 
  }) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  void _selectPosition(LatLng pos) {
    setState(() {
      _pickedLocation = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: <Widget>[
          if (!widget.isReadOnly)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _pickedLocation == null ? null : () {
                Navigator.of(context).pop(_pickedLocation);
              },
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 13,
        ),
        onTap: widget.isReadOnly ? null : _selectPosition,
        markers: _pickedLocation == null 
        ? {} 
        : {
          Marker(
            markerId: const MarkerId('m1'),
            position: _pickedLocation!,
          ),
        },
      ),
    );
  }
}