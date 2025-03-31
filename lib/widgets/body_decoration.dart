import 'package:flutter/material.dart';

BoxDecoration bodyDecoration(
  {bool isDarkMode = true}
) {
  return BoxDecoration(
     
          gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: isDarkMode
          ? [ Colors.black,
              Colors.grey.shade900,
            ]
          : [
              Colors.white,
              const Color.fromARGB(255, 89, 118, 141),],
    ),
  );
}


