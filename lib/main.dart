import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/navigator_services.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, _) {
        return MaterialApp(
          title: 'TEC26',
          theme: ThemeData(
            textTheme: GoogleFonts.plusJakartaSansTextTheme(),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            textTheme: GoogleFonts.plusJakartaSansTextTheme(),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: currentMode,
          home: const NavigatorServices(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
