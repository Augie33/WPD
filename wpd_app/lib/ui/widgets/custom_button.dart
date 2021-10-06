import 'package:flutter/material.dart';
import 'package:wpd_app/utils/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.black87,
          size: 30,
        ),
        label: Text(
          label,
          style: AppTheme.lightTextTheme.headline3!.copyWith(
            color: Colors.black87,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
