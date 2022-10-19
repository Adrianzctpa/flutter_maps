import 'package:flutter/material.dart';
import 'package:flutter_nativeresources/components/photo_input.dart';

class LocationForm extends StatefulWidget {
  const LocationForm({Key? key}) : super(key: key);

  @override
  LocationFormState createState() => LocationFormState();
}

class LocationFormState extends State<LocationForm> {
  final _titleController = TextEditingController();

  void _submitForm() {
    if (_titleController.text.isEmpty) {
      return;
    }
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
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const PhotoInput(),
                  ]
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _submitForm,
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