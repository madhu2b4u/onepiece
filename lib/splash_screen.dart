import 'dart:async';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onepiece/auth/screen/LoginScreen.dart';
import 'package:onepiece/utils/Constants.dart';

import 'home/screen/HomeScreen.dart';

final box = GetStorage();

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<bool> _checkLoginStatus() async {
    box.remove(Constants.isLoggedIn);
    await Future.delayed(const Duration(seconds: 2));
    return box.read(Constants.isLoggedIn) ?? false;
  }

  @override
  Widget build(BuildContext context) {

    bool isLoggedIn = box.read(Constants.isLoggedIn) ?? false;

    return FutureBuilder<bool>(
      // Simulate some asynchronous operation, like checking login status
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the check is in progress, show a loading screen
          return EasySplashScreen(
            logo: Image.network(
                'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
            title: const Text(
              "Title",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
          );
        } else if (snapshot.hasError) {
          // Handle errors here
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        } else {
          // After checking login status, redirect to the appropriate screen
          return isLoggedIn ? const HomeScreen() : LoginScreen();
        }
      },
    );
  }
}

