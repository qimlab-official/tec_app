import 'package:flutter/material.dart';

class FaqsPage extends StatefulWidget {
  const FaqsPage({super.key});

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [const Text('FAQs')],
        ),
      ),
    );
  }
}
