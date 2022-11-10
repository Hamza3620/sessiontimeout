import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sessiontimeout/globals.dart';
import 'package:sessiontimeout/screens/login_screen.dart';

final sessionTimer = SessionTimer();

class SessionTimer {
  void startTimer() {
    Globals.timer =
        Timer.periodic(const Duration(seconds: Globals.timeoutDuration), (_) {
      timedOut();
    });
  }

  void stopTimer() {
    if (Globals.timer != null && Globals.timer!.isActive) {
      Globals.timer!.cancel();
    }
  }

  void userActivityDetected([_]) {
    debugPrint("Activity detected!");
    if (Globals.timer != null && Globals.timer!.isActive) {
      Globals.timer!.cancel();
      startTimer();
    }
    return;
  }

  Future<void> timedOut() async {
    Globals.timer!.cancel();
    await showDialog(
      context: Globals.navigatorKey.currentState!.context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            title: const Icon(
              Icons.warning_amber_outlined,
              color: Colors.red,
              size: 50,
            ),
            elevation: 6,
            actionsAlignment: MainAxisAlignment.center,
            content: const Text('You session has expired',
                textAlign: TextAlign.center),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.lightBlue)),
                onPressed: () async {
                  Navigator.of(Globals.navigatorKey.currentState!.context)
                      .pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (Route<dynamic> route) => false);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
