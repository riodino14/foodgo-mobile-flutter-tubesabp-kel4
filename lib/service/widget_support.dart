import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle HeadLineTextFieldStyle() {
    return TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle SimpleLineTextFieldStyle() {
    return TextStyle(color: Colors.black, fontSize: 18);
  }

  static TextStyle WhiteTextFieldStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle priceTextFieldStyle() {
    return TextStyle(
      color: const Color.fromARGB(174, 0, 0, 0),
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldWhiteTextFieldStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle SignUpTextFieldStyle() {
    return TextStyle(
      color: const Color.fromARGB(174, 0, 0, 0),
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
  }
}
