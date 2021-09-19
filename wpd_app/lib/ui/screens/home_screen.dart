import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            // color: Theme.of(context).primaryColor,
            iconSize: 32,
            onPressed: () {
              Routemaster.of(context).push('add');
            },
          )
        ],
      ),
    );
  }
}
