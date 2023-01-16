// ignore: unused_import
import 'dart:collection';
import '/Model/trip_list.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: unused_import
import '/Model/trip.dart';
// ignore: unused_import

// ignore: camel_case_types, use_key_in_widget_constructors
class tripMap extends StatefulWidget {
  static const screenroute = 'tripMap';
  // const tripMap({Key? key}) : super(key: key);

  @override
  State<tripMap> createState() => _tripMapState();
}

// ignore: camel_case_types
class _tripMapState extends State<tripMap> {
  var mymareks = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final tripid = ModalRoute.of(context)!.settings.arguments as String;
    // // ignore: avoid_types_as_parameter_names
    // print(tripid);
    // ignore: avoid_types_as_parameter_names
    final selectLatLng = ReadJson.items.firstWhere((trip) => trip.id == tripid);
    // ignore: prefer_const_constructors

    // var selectLatLng2 = selectLatLng;
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            // ignore: prefer_const_constructors
            CameraPosition(
                target: LatLng(
                    selectLatLng.Lat!.toDouble(), selectLatLng.Lng!.toDouble()),
                zoom: 19),
        onMapCreated: (GoogleMapController googleMapController) => setState(
          () {
            // ignore: prefer_const_constructors
            mymareks.add(
              Marker(
                // ignore: prefer_const_constructors
                markerId: MarkerId(selectLatLng.id.toString()),

                // ignore: prefer_const_constructors
                infoWindow: InfoWindow(title: selectLatLng.title),
                // ignore: prefer_const_constructors
                position: LatLng(
                    selectLatLng.Lat!.toDouble(), selectLatLng.Lng!.toDouble()),
              ),
            );
          },
        ),
        markers: mymareks,
      ),
    );
  }
}
