import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
   MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.labelText,
      required this.secureText, required TextStyle textStyle, required InputDecoration inputDecoration});

  final controller;
  final String hintText;
  final String labelText;
  final bool secureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: secureText,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blueGrey),
              gapPadding: 10,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blueAccent),
              gapPadding: 10,
            )
          ),
      ),
    );
  }
}
