// ignore: unused_import
import 'package:flutter/material.dart';
import '../Model/trip.dart';
// ignore: unused_import
import '../Widget/trips_items.dart';

class FavoritsScreen extends StatelessWidget {
  // const FavoritsScreen({Key? key}) : super(key: key);
  final List<trip> favoritsTrips;
  // ignore: use_key_in_widget_constructors
  const FavoritsScreen(this.favoritsTrips);

  @override
  Widget build(BuildContext context) {
    if (favoritsTrips.isEmpty) {
      return const Center(
        child: Text('ليس لديك أي رحلة في قائمة المفضلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripDetailScreen(
            id: favoritsTrips[index].id.toString(),
            title: favoritsTrips[index].title.toString(),
            imageurl: favoritsTrips[index].imageurl.toString(),
            price: favoritsTrips[index].price.toString(),
          );
        },
        itemCount: favoritsTrips.length,
      );
    }
  }
}
