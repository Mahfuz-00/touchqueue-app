import 'package:flutter/material.dart';

import 'Presentation/Pages/SplashScreen Page/Pages/SplashScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'default',
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            onPrimary: Colors.deepPurple,
            background: Colors.white),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
