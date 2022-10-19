import 'package:flutter/material.dart';
import 'package:flutter_nativeresources/utils/constraints.dart';

class LocationListScreen extends StatelessWidget {
  const LocationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
         actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(Constraints.locationForm);
            },
          )
        ]
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}