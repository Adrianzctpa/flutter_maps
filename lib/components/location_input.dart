import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_nativeresources/utils/location_util.dart';
import 'package:flutter_nativeresources/screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({required this.onSelectLocation, Key? key}) : super(key: key);

  final Function(LatLng) onSelectLocation;

  @override
  LocationInputState createState() => LocationInputState();
}

class LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  void _showPreview(double lat, double lng) {
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImg(latitude: lat, longitude: lng);
  
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentLocation() async {
    final locData = await Location().getLocation();
    _showPreview(locData.latitude as double, locData.longitude as double);
  
    widget.onSelectLocation(LatLng(locData.latitude as double, locData.longitude as double));
  }

  Future<void> _selectOnMap() async {
    final LatLng? selectedLoc = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => const MapScreen(),
      ),
    );

    if (selectedLoc == null) return;

   _showPreview(selectedLoc.latitude, selectedLoc.longitude);
    widget.onSelectLocation(selectedLoc);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
          ? const Text(
            'No Location Chosen',
            textAlign: TextAlign.center,
          )
          : Image.network(
            _previewImageUrl!,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}