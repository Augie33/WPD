import 'package:flutter/material.dart';

class ShowAccountScreen extends StatelessWidget {
  const ShowAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new account'),
      ),
    );
  }
}
