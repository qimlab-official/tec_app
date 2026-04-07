import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key, required this.title});

  final String title;

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [const Text('More')],
        ),
      ),
    );
  }
}
