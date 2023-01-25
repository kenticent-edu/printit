import 'package:flutter/material.dart';

class AppColorsGradients {
  static const Color blueButtonColor = Color.fromRGBO(0, 122, 255, 1);
  static const Color darkGrayFillFormAndHeader = Color.fromRGBO(44, 44, 46, 1);
  static const Color whiteInTextsAndButtons = Color.fromRGBO(255, 255, 255, 1);
  static const Color whiteInHeadings = Color.fromRGBO(245, 245, 245, 1);
  static const Color blackInTextsAndButtons = Color.fromRGBO(0, 0, 0, 1);
  static const Color darkGrayInBody = Color.fromRGBO(22, 23, 24, 1);
  static const LinearGradient redLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(255, 5, 102, 1),
      Color.fromRGBO(255, 5, 102, 1),
      Color.fromRGBO(126, 2, 50, 0.69),
      Color.fromRGBO(0, 0, 0, 1)
    ],
  );
  static const LinearGradient greenLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(5, 255, 165, 1),
      Color.fromRGBO(5, 255, 120, 1),
      Color.fromRGBO(2, 126, 89, 0.69),
      Color.fromRGBO(0, 0, 0, 1)
    ],
  );
  static const LinearGradient grayLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color.fromRGBO(66, 66, 66, 1), Color.fromRGBO(0, 0, 0, 1)],
  );
}
