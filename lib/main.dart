// ignore: unused_import
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter, unused_import
// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import '../Model/trip.dart';
import './Screen/trips_screen.dart';
import '../Screen/trips_detail.dart';
// import 'app_data.dart';
// ignore: unused_import
import 'package:flutter_localizations/flutter_localizations.dart';
import './Screen/tabs_screen.dart';
import 'Screen/goole_map.dart';
import '/Model/trip_list.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable, use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: prefer_final_fields
  final List<trip> _favoriteTrips = [];
  // ignore: unused_element
  void _manageFavorite(String tripId) {
    final existingIndex =
        // ignore: avoid_types_as_parameter_names
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
        // items.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(
          // ignore: avoid_types_as_parameter_names
          ReadJson.items.firstWhere((trip) => trip.id == tripId),
        );
      });
    }
  }

  bool _isFovarite(String id) {
    // ignore: avoid_types_as_parameter_names
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('ar', 'AR'), // English, no country code
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        fontFamily: 'ElMessiri',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoriteTrips),
        TripsScreen.screenRoute: (context) => TripsScreen(),
        tripDetail.screenroute: (context) =>
            tripDetail(_manageFavorite, _isFovarite),
        tripMap.screenroute: (context) => tripMap(),
      },
    );
  }
}
