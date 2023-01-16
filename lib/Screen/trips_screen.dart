import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: unused_import
import '../Model/trip.dart';
import '../Widget/trips_items.dart';
// ignore: unused_import
// import '../app_data.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:st_app/Model/trip_list.dart';
import 'package:path_provider/path_provider.dart';

// ignore: use_key_in_widget_constructors
class TripsScreen extends StatefulWidget {
  static const screenRoute = '/TripsScreen';

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readjsondata(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text('$data.error'),
            );
          } else if (data.hasData) {
            var item = data.data as List<trip>;
            ReadJson.items = item;

            return ListView.builder(
                // ignore: unnecessary_null_comparison
                itemCount: item == null ? 0 : item.length,
                itemBuilder: (context, index) {
                  return TripDetailScreen(
                    id: item[index].id.toString(),
                    title: item[index].title.toString(),
                    imageurl: item[index].imageurl.toString(),
                    price: item[index].price.toString(),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<trip>> readjsondata() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('JsonFileApp/trip.json');
    final list = jsonDecode(jsondata) as List<dynamic>;

    return list.map((e) => trip.fromjson(e)).toList();
  }
}
