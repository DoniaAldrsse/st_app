// ignore: unused_import
// import '/app_data.dart';
// ignore: unused_import
import 'dart:convert';

import '../Model/trip.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import '../Screen/trips_screen.dart';
import 'package:st_app/Screen/trips_detail.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;

// ignore: camel_case_types, must_be_immutable
class TripDetailScreen extends StatelessWidget {
  late String id;
  late String title;
  late String imageurl;
  late String price;

  TripDetailScreen(
      {Key? key,
      required this.id,
      required this.title,
      required this.imageurl,
      required this.price})
      : super(key: key);
  // ignore: use_key_in_widget_constructors
  TripDetailScreen.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageurl = json['imageurl'];
    price = json['price'];
  }

  void selecttrip(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables

    Navigator.of(context).pushNamed(tripDetail.screenroute, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return InkWell(
      onTap: () => selecttrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.place,
                        // ignore: deprecated_member_use
                        color: Theme.of(context).accentColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text('الخريطة'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        // ignore: deprecated_member_use
                        color: Theme.of(context).accentColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text('اتصل'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.paid_rounded,
                        // ignore: deprecated_member_use
                        color: Theme.of(context).accentColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(price),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
