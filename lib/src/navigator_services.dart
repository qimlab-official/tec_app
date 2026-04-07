import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ui/exhibitor.dart';
import '../ui/home.dart';
import '../ui/map/map.dart';
import '../ui/more.dart';
import '../ui/schedule.dart';

class NavigatorServices extends StatefulWidget {
  const NavigatorServices({super.key, required this.title});

  final String title;

  @override
  State<NavigatorServices> createState() => _NavigatorServicesState();
}

class _NavigatorServicesState extends State<NavigatorServices> {
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
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(right: 10),
            child: IconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.light_mode_outlined),
            ),
          ),
        ],
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: Text(
          widget.title,
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
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
