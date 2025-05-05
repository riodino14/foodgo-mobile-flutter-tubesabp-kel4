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
    return TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
  }
}
