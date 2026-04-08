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
    final bool isLargeScreen = MediaQuery.of(context).size.width >= 650;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Scan QR Code',
        child: const Icon(Icons.qr_code_scanner),
      ),
      body: isLargeScreen
          ? Row(
              children: [
                NavigationRail(
                  groupAlignment: 0,
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: const <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.map_rounded),
                      label: Text('Map'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.business),
                      label: Text('Exhibitor'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.schedule_rounded),
                      label: Text('Schedule'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.more_horiz_rounded),
                      label: Text('More'),
                    ),
                  ],
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: _pages[_selectedIndex]),
              ],
            )
          : _pages[_selectedIndex],
      bottomNavigationBar: isLargeScreen
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: const <NavigationDestination>[
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                  icon: Icon(Icons.map_rounded),
                  label: 'Map',
                ),
                NavigationDestination(
                  icon: Icon(Icons.business),
                  label: 'Exhibitor',
                ),
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
