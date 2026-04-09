import 'package:flutter/material.dart';
import '../main.dart';
import '../ui/home/exhibitor/exhibitor.dart';
import '../ui/home/home.dart';
import '../ui/home/map/map.dart';
import '../ui/home/more/more.dart';
import '../ui/home/schedule/schedule.dart';
import '../ui/notification/notification.dart';

class NavigatorServices extends StatefulWidget {
  const NavigatorServices({super.key});

  @override
  State<NavigatorServices> createState() => _NavigatorServicesState();
}

class _NavigatorServicesState extends State<NavigatorServices> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(title: 'Home'),
    const MapPage(title: 'Map'),
    const ExhibitorPage(title: 'Exhibitor'),
    const SchedulePage(),
    const MorePage(title: 'More'),
  ];
  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width >= 650;

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 5),
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
          Padding(
            padding: const EdgeInsets.only(right: 8),
            //theme button
            child: ValueListenableBuilder<ThemeMode>(
              valueListenable: themeNotifier,
              builder: (_, ThemeMode currentMode, _) {
                IconData iconData;
                if (currentMode == ThemeMode.light) {
                  iconData = Icons.light_mode_outlined;
                } else if (currentMode == ThemeMode.dark) {
                  iconData = Icons.dark_mode_outlined;
                } else {
                  iconData = Icons.brightness_auto_outlined;
                }
                return IconButton.outlined(
                  onPressed: () {
                    if (currentMode == ThemeMode.system) {
                      themeNotifier.value = ThemeMode.light;
                    } else if (currentMode == ThemeMode.light) {
                      themeNotifier.value = ThemeMode.dark;
                    } else {
                      themeNotifier.value = ThemeMode.system;
                    }
                  },
                  icon: Icon(iconData),
                );
              },
            ),
          ),
        ],

        title: Image.asset(
          'assets/image/logo/tec_logo_appbar.webp',
          height: 50,
        ),
      ),
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
                      label: Text('Agenda'),
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
                NavigationDestination(
                  icon: Icon(Icons.auto_awesome_mosaic_outlined),
                  selectedIcon: Icon(Icons.auto_awesome_mosaic_rounded),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.map_outlined),
                  selectedIcon: Icon(Icons.map_rounded),
                  label: 'Map',
                ),
                NavigationDestination(
                  icon: Icon(Icons.business_outlined),
                  selectedIcon: Icon(Icons.business_rounded),
                  label: 'Exhibitor',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.view_agenda_rounded),
                  icon: Icon(Icons.view_agenda_outlined),
                  label: 'Agenda',
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
