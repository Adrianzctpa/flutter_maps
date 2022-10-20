import 'package:flutter/material.dart';
import 'package:flutter_nativeresources/utils/constraints.dart';
import 'package:flutter_nativeresources/providers/cool_locations.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<CoolLocations>(
        builder: (ctx, prov, ch) => prov.itemsCount == 0
            ? ch!
            : ListView.builder(
                itemCount: prov.itemsCount,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(prov.getItem(i).photo),
                  ),
                  title: Text(prov.getItem(i).title),
                  onTap: () {
                    // Go to detail page ...
                  },
                ),
              ),
        child: const Text('Location List'),
      ),
    );
  }
}