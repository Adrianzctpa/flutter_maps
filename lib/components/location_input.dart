import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_nativeresources/utils/location_util.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  LocationInputState createState() => LocationInputState();
}

class LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImg(latitude: locData.latitude as double, longitude: locData.longitude as double);
  
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
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
              onPressed: _getCurrentLocation,
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