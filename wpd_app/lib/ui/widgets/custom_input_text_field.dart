import 'package:flutter/material.dart';

class CustomInputTextField extends StatelessWidget {
  const CustomInputTextField({
    Key? key,
    required this.controller,
    this.initialValue,
    required this.validator,
    required this.hintText,
    required this.icon,
    this.maxLines = 1,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String? initialValue;
  final String? Function(String?)? validator;
  final String hintText;
  final IconData icon;
  final int maxLines;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        obscureText: obscureText,
        cursorColor: Theme.of(context).primaryColor,
        maxLines: maxLines,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 18),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
