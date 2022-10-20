import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_nativeresources/providers/cool_locations.dart';
import 'package:flutter_nativeresources/screens/location_list_screen.dart';
import 'package:flutter_nativeresources/screens/location_form.dart';
import 'package:flutter_nativeresources/utils/constraints.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoolLocations(),
      child: MaterialApp(
        title: 'Cool Locations',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.amber
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity, 
        ),
        home: const LocationListScreen(),
        routes: {
          Constraints.locationForm: (context) => const LocationForm(),
        },
      ),
    );
  }
}