import 'package:flutter/material.dart';
import 'package:flutter_nativeresources/models/location.dart';
import 'package:flutter_nativeresources/screens/map_screen.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Location loc = ModalRoute.of(context)!.settings.arguments as Location;
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.file(
              loc.photo,
              fit: BoxFit.cover,
              width: double.infinity,
            )
          ),
          const SizedBox(height: 10),
          Text(
            loc.location!.address as String,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.grey
            ),
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                    initialLocation: loc.location as LocationData,
                    isReadOnly: true,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.map),
            label: const Text('Select on Map'),
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
          ),
        ],
      )
    );
  }
}