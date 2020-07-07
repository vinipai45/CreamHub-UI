import 'package:flutter/material.dart';
import 'package:firstapp/screens/home.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen.navigate(
        backgroundColor: Colors.amber[600],
        name: 'assets/flare/CreamHub.flr',
        next: (context) => Home(),
        until: () => Future.delayed(Duration(seconds: 3)),
        startAnimation: 'intro',
      ),
    );
  }
}
