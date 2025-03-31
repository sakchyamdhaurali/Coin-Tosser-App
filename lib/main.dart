import 'package:coin_tosser/pages/coin_flipper.dart';
// import 'package:coin_tosser/pages/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const Center(
          child: CoinFlipper(),
        ),
      ),
    );
  }
}


