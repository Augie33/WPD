import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.list,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.share),
            label: 'Share',
            onTap: () {/* Do someting */},
          ),
          SpeedDialChild(
            child: const Icon(Icons.send),
            label: 'Email',
            onTap: () {/* Do someting */},
          ),
          SpeedDialChild(
            child: const Icon(Icons.qr_code_2),
            label: 'QR Code',
            onTap: () {/* Do someting */},
          ),
        ],
      ),
    );
  }
}
