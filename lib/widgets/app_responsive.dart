import 'package:flutter/material.dart';

class ResponsiveHelper {
  static double getWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }

  static double getHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }

  static double getTextSize(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }
}