import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skygoal_home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skygoal Home',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(4, 60, 110, 1),
        fontFamily: 'Lato',
      ),
      home: const HomeScreen(),
    );
  }
}
