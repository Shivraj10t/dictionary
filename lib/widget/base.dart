import 'package:dictionary/widget/dictionary/dictionary.dart';
import 'package:dictionary/widget/events/events.dart';

import 'package:dictionary/widget/places/place.dart';
import 'package:dictionary/widget/profile/profile.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const Dictionary(),
    const Events(),
    const Place(),
    const Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      // floatingActionButton: FloatingActionButton(
      //   //mini: true,
      //   onPressed: () {},
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.indigo.withOpacity(0.8),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.chrome_reader_mode),
              icon: Icon(Icons.chrome_reader_mode_outlined),
              label: "डिक्शनरी"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.event_outlined),
              icon: Icon(Icons.event_rounded),
              label: "आयोजन"
              // "Event"
              ),
          // BottomNavigationBarItem(
          //     label: "", icon: FloatingActionButton(onPressed: () {})),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.place_rounded),
              icon: Icon(Icons.place_outlined),
              label: "स्थान"
              // "Place"
              ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person_pin_rounded),
              icon: Icon(Icons.person_pin_outlined),
              label: "प्रोफ़ाइल"
              // "Profile"
              ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigoAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
