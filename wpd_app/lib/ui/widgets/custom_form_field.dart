import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.controller,
    this.validator,
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
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 11),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        cursorColor: Theme.of(context).primaryColor,
        maxLines: 1,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          focusedBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 18),
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}
