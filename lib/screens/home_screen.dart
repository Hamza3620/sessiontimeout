import 'package:flutter/material.dart';
import 'package:sessiontimeout/screens/help_screen.dart';
import 'package:sessiontimeout/screens/login_screen.dart';
import 'package:sessiontimeout/screens/settings_screen.dart';
import 'package:sessiontimeout/session_timer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                sessionTimer.stopTimer();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
              },
              icon: const Icon(Icons.power_settings_new_outlined))
        ],
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ));
            },
            title: const Text("Go to Settings"),
            trailing: const Icon(Icons.settings),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HelpScreen(),
              ));
            },
            title: const Text("Go to Help"),
            trailing: const Icon(Icons.help_outline),
          ),
        ],
      ),
    );
  }
}
