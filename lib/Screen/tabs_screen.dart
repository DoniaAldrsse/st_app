import 'package:flutter/material.dart';
import '../Model/trip.dart';
// ignore: unused_import
import '../Screen/trips_detail.dart';
// ignore: unused_import
import './trips_screen.dart';
// ignore: unused_import
import './favorits_screen.dart';
// ignore: duplicate_import
import '../Model/trip.dart';

// ignore: use_key_in_widget_constructors
class TabsScreen extends StatefulWidget {
  // const TabsScreen({Key key}) : super(key: key);
  final List<trip> favoritsTrips;
  // ignore: use_key_in_widget_constructors

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

  // ignore: use_key_in_widget_constructors
  const TabsScreen(this.favoritsTrips);
  @override
  // ignore: library_private_types_in_public_api
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  // ignore: prefer_final_fields
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    _screens = [
      {
        'Screen': TripsScreen(),
        'Title': 'قورينا',
      },
      {
        'Screen': FavoritsScreen(widget.favoritsTrips),
        'Title': 'المفضلة',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['Title'] as String,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _screens[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_sharp,
              color: Colors.red,
            ),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
