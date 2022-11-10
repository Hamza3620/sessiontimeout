import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help")),
      body: Center(
        child: GestureDetector(
            onTap: (() {
              Navigator.of(context).pop();
            }),
            child: const Card(child: Text("Go back!"))),
      ),
    );
  }
}
