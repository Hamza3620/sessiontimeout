import 'package:flutter/material.dart';
import 'package:sessiontimeout/screens/home_screen.dart';
import 'package:sessiontimeout/session_timer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "SESSION TIMEOUT APP",
                style: TextStyle(fontSize: 22),
              ),
              const TextField(
                decoration: InputDecoration(label: Text("Email")),
              ),
              const TextField(
                decoration: InputDecoration(label: Text("Password")),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          sessionTimer.startTimer();
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                        },
                        child: const Text("LOGIN")),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
