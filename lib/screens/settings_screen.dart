import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
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
