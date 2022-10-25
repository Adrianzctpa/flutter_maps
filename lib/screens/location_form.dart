import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_nativeresources/providers/cool_locations.dart';
import 'package:flutter_nativeresources/components/location_input.dart';
import 'package:flutter_nativeresources/components/photo_input.dart';

class LocationForm extends StatefulWidget {
  const LocationForm({Key? key}) : super(key: key);

  @override
  LocationFormState createState() => LocationFormState();
}

class LocationFormState extends State<LocationForm> {
  final _titleController = TextEditingController();
  File? _photo;
  LatLng? _pickedLocation;

  void _takePhoto(File photo) {
    setState(() {
      _photo = photo;
    });
  }

  void _selectLocation(LatLng pos) {
    setState(() {
      _pickedLocation = pos;
    });
  }

  bool _isValid() {
    return _titleController.text.isNotEmpty && _photo != null && _pickedLocation != null;
  }

  void _submitForm() {
    if (!_isValid()) return;
    Provider.of<CoolLocations>(context, listen: false).addLocation(_titleController.text, _photo as File, _pickedLocation as LatLng);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new location'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PhotoInput(onSetImage: _takePhoto),
                    const SizedBox(
                      height: 10,
                    ),
                    LocationInput(onSelectLocation: _selectLocation) 
                  ]
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _isValid() ? _submitForm : null,
            icon: const Icon(Icons.add_location),
            label: const Text('Add Location'),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
            ),
          ),
        ],
      )
    );
  }
}