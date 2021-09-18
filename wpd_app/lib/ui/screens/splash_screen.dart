import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 45),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/logo.png',
                height: 150,
                width: 150,
              ),
            ),
          ),
          const Center(
            child: CupertinoActivityIndicator(),
          ),
        ],
      ),
    );
  }
}
