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
      body: FutureBuilder(
        future: Provider.of<CoolLocations>(context, listen: false).loadLocations(),
        builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting 
        ? const Center(child: CircularProgressIndicator())
        : Consumer<CoolLocations>(
          builder: (ctx, prov, ch) => prov.itemsCount == 0
              ? ch!
              : ListView.builder(
                  itemCount: prov.itemsCount,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(prov.getItem(i).photo),
                    ),
                    title: Text(prov.getItem(i).title),
                    subtitle: Text(prov.getItem(i).location!.address as String),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Constraints.locationDetail,
                        arguments: prov.getItem(i),
                      );
                    },
                  ),
                ),
          child: const Center(child: Text('No locations')),
        ),
      ),
    );
  }
}