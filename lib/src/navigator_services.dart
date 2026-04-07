import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ui/exhibitor.dart';
import '../ui/home.dart';
import '../ui/map/map.dart';
import '../ui/more.dart';
import '../ui/notification/notification.dart';
import '../ui/schedule.dart';

class NavigatorServices extends StatefulWidget {
  const NavigatorServices({super.key, required this.title});

  final String title;

  @override
  State<NavigatorServices> createState() => _NavigatorServicesState();
}

class _NavigatorServicesState extends State<NavigatorServices> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      drawer: Drawer(
        child: NavigationDrawer(
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onDestinationSelected: (int index) {
            setState(() {});
          },
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Container(
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.blueAccent),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'TEC 2026',
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            NavigationDrawerDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_filled),
              label: Text("Home"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.info_outline),
              selectedIcon: Icon(Icons.info_rounded),
              label: Text("About Us"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.history_outlined),
              selectedIcon: Icon(Icons.history_rounded),
              label: Text("Throwback"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.upcoming),
              selectedIcon: Icon(Icons.upcoming),
              label: Text("Career Development Series"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.help_outline_rounded),
              selectedIcon: Icon(Icons.help_rounded),
              label: Text("FAQs"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ),
                );
              },
              icon: const Icon(Icons.notifications),
            ),
          ),
          //Padding(
          //  padding: EdgeInsetsGeometry.only(right: 10),
          //  child: IconButton.outlined(
          //    onPressed: () {},
          //   icon: const Icon(Icons.light_mode_outlined),
          // ),
          // ),
        ],
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
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
