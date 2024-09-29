import 'package:flutter/material.dart';

class textFieldDecoration {
  InputDecoration mainInputDecoration() {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 82, 121, 184), width: 1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 80, 142, 193)),
        borderRadius: BorderRadius.circular(10.0), // Border when enabled
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.red,
      )),
    );
  }
}
