import 'package:flutter/material.dart';

class CustomBorderFormField extends StatelessWidget {
  const CustomBorderFormField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.icon,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final IconData icon;
  final TextInputType textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Theme.of(context).backgroundColor,
      //   borderRadius: const BorderRadius.all(Radius.circular(15)),
      // ),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 11),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        cursorColor: Theme.of(context).primaryColor,
        maxLines: 1,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          icon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 18),
        ),
        validator: validator,
      ),
    );
  }
}
