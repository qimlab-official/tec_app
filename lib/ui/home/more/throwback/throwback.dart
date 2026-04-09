import 'package:flutter/material.dart';

class ThrowbackPage extends StatefulWidget {
  const ThrowbackPage({super.key});

  @override
  State<ThrowbackPage> createState() => _ThrowbackPageState();
}

class _ThrowbackPageState extends State<ThrowbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('Throwback')],
        ),
      ),
    );
  }
}
