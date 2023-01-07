import 'package:flutter/widgets.dart';

class AppColor {
  AppColor._();
  static const Color blueColor = Color(0xFF2F39C5);

  static const Color brandColor = Color.fromRGBO(41, 42, 124, 1);
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );
}
