import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

Widget normalText(
  String text, {
  double size = 24,
  Color color = Colors.white,
  bool isDarkMode = true ,
}) {
  return Text(
    text,
    style: GoogleFonts.lato(
        color: isDarkMode? color : Colors.black, fontSize: size, fontWeight: FontWeight.normal),
  );
}

Widget glowCoinName({
  required String text,
  bool isDarkMode= true,
  }) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: isDarkMode?Colors.white:Colors.black87,
      shadows: [
        Shadow(
          color: isDarkMode? Colors.orangeAccent: Colors.orange.shade300, // Outer glow
          blurRadius: 30,
        ),
        Shadow(
          color: isDarkMode?Colors.deepOrange:Colors.deepOrange.shade700, // Mid glow
          blurRadius: 20,
        ),
      ],
    ),
  ).animate().fade(duration: 800.ms).scale(duration: 500.ms);
}
