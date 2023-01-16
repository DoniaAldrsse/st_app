// ignore: unused_import
import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import, library_prefixes
import 'package:flutter/services.dart' as s;
import 'package:st_app/Model/trip_list.dart';
// ignore: unused_import
import '/Model/trip.dart';
// import '/Screen/goole_map.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// ignore: unused_import
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// ignore: unused_import, duplicate_import
import '../Screen/goole_map.dart';

// ignore: camel_case_types, use_key_in_widget_constructors, must_be_immutable
class tripDetail extends StatefulWidget {
  static const screenroute = 'tripDetail';
  final Function mangeFavorite;
  // ignore: unused_field
  final Function isFovarite;

  // ignore: use_key_in_widget_constructors
  const tripDetail(this.mangeFavorite, this.isFovarite);

  @override
  State<tripDetail> createState() => _tripDetailState();
}

// ignore: camel_case_types
class _tripDetailState extends State<tripDetail> {
  // double ratting = 0.0;

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      // ignore: prefer_const_constructors, sort_child_properties_last
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.paid_rounded,
                // ignore: deprecated_member_use
                color: Theme.of(context).accentColor,
              ),
              Text(
                titleText,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
    );
  }

  Widget descriptionContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  @override
  // ignore: override_on_non_overriding_member

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names
    final tripid = ModalRoute.of(context)!.settings.arguments as String;
    // ignore: avoid_types_as_parameter_names
    // final selectTrip = tripsitem.firstWhere((trip) => trip.id == tripid);
    // ignore: avoid_types_as_parameter_names
    final selectTrip = ReadJson.items.firstWhere((trip) => trip.id == tripid);

    // // ignore: unused_element, unused_local_variable
    // var r = selecttrip.rating;

    void selectmapp(BuildContext context) {
      Navigator.of(context)
          .pushNamed(tripMap.screenroute, arguments: selectTrip.id);
    }

    // Widget buildRating() => RatingBar.builder(
    //       initialRating: r,
    //       // minRating: 1,
    //       direction: Axis.horizontal,
    //       allowHalfRating: true,
    //       itemCount: 5,
    //       itemSize: 30.0,
    //       itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
    //       // ignore: prefer_const_constructors
    //       itemBuilder: (context, _) => Icon(
    //         Icons.star,
    //         color: Colors.amber,
    //       ),
    //       updateOnDrag: true,

    //       onRatingUpdate: (ratting) => setState(() {
    //         // ignore: unnecessary_this
    //         r = ratting;

    //         // ignore: avoid_print
    //         print(r);
    //       }),
    //     );
    // void showRating() => showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //           title: const Text(
    //             ' قيم هذا الفندق',
    //             style: TextStyle(fontFamily: 'ElMessiri'),
    //           ),
    //           content: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               // ignore: prefer_const_constructors
    //               Text(
    //                 'الرجاء ترك تقييم',
    //                 style: const TextStyle(
    //                   fontFamily: 'ElMessiri',
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //               buildRating(),
    //             ],
    //           ),
    //           actions: [
    //             TextButton(
    //               onPressed: () => Navigator.pop(context),
    //               child: const Text(
    //                 'موافق',
    //                 style: TextStyle(fontFamily: 'ElMessiri'),
    //               ),
    //             )
    //           ],
    //         ));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectTrip.title.toString(),
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
          // ignore: sized_box_for_whitespace
          children: [
            // ignore: sized_box_for_whitespace
            Expanded(
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectTrip.imageurl.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Text("$selecttrip.rating"),
            const SizedBox(height: 10),
            // ignore: avoid_unnecessary_containers
            Container(
                child: Row(
              children: [
                // TextButton(
                //     onPressed: () => showRating(),
                //     child: const Text('عرض التقييم',
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 16,
                //             color: Colors.grey,
                //             fontFamily: 'ElMessiri'))),
                // Container(
                //   // ignore: sort_child_properties_last
                //   child: buildRating(),
                //   alignment: Alignment.topRight,
                // ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: IconButton(
                    // ignore: prefer_const_constructors
                    icon: Icon(
                      Icons.place,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () => selectmapp(context),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Container(
                    // ignore: sort_child_properties_last
                    child: IconButton(
                        onPressed: (() {
                          FlutterPhoneDirectCaller.callNumber(
                              selectTrip.phone.toString());
                          // print(tripid);
                        }),
                        icon: const Icon(
                          Icons.phone,
                          color: Colors.amber,
                          size: 35.0,
                        )),
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            )),

            descriptionContainer(
              // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
              Container(
                // ignore: sort_child_properties_last
                child: Column(
                  children: [
                    Text(
                      selectTrip.description.toString(),
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
                width: 500,
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            widget.isFovarite(tripid) ? Icons.favorite : Icons.favorite_border),
        onPressed: () => widget.mangeFavorite(tripid),
      ),
    );
  }
}
