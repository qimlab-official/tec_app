import 'package:flutter/material.dart';
import 'exhibitor.dart';
import 'home.dart';
import 'map/map.dart';
import 'more.dart';
import 'schedule.dart';

class HomeNavPage extends StatefulWidget {
  const HomeNavPage({super.key});

  @override
  State<HomeNavPage> createState() => _HomeNavPageState();
}

class _HomeNavPageState extends State<HomeNavPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(title: 'Home'),
    const MapPage(title: 'Map'),
    const ExhibitorPage(title: 'Exhibitor'),
    const SchedulePage(title: 'Schedule'),
    const MorePage(title: 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.map_rounded), label: 'Map'),
          NavigationDestination(icon: Icon(Icons.business), label: 'Exhibitor'),
          NavigationDestination(
            icon: Icon(Icons.schedule_rounded),
            label: 'Schedule',
          ),
          NavigationDestination(
            icon: Icon(Icons.more_horiz_rounded),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
