import 'package:flutter/material.dart';

import 'src/navigator_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEC26',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      home: const NavigatorServices(title: 'Technology Education Career (TEC)'),
      debugShowCheckedModeBanner: false,
    );
  }
}
