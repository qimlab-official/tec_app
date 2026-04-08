import 'package:flutter/material.dart';
import '../main.dart';
import '../ui/home/home_nav.dart';
import '../ui/notification/notification.dart';
import '../ui/about_us/about_us.dart';
import '../ui/throwback/throwback.dart';
import '../ui/career_dev_series/career.dart';
import '../ui/faqs/faqs.dart';

class NavigatorServices extends StatefulWidget {
  const NavigatorServices({super.key});

  @override
  State<NavigatorServices> createState() => _NavigatorServicesState();
}

class _NavigatorServicesState extends State<NavigatorServices> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeNavPage(),
    const AboutUsPage(),
    const ThrowbackPage(),
    const CareerPage(),
    const FaqsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: NavigationDrawer(
          selectedIndex: _selectedIndex,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            Navigator.pop(context);
          },
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Container(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/image/logo/tec_logo_appbar.webp',
                        height: 80,
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
            padding: const EdgeInsets.only(right: 10),
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
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: Image.asset(
          'assets/image/logo/tec_logo_appbar.webp',
          height: 50,
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
