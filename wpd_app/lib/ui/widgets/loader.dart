import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
      ),
    );
  }
}

class ScreenLoader extends StatelessWidget {
  const ScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppLoader(),
      ),
    );
  }
}

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    final baseColor = isDarkMode
        ? Colors.grey[700] ?? Colors.black
        : Colors.grey[200] ?? Colors.white;

    final highlightColor = isDarkMode
        ? Colors.grey[600] ?? Colors.black
        : Colors.grey[100] ?? Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: ListTile(
            title: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  color: Colors.black,
                ),
              ),
            ),
            subtitle: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 3),
                child: Container(
                  width: 27.0,
                  height: 27.0,
                  color: Colors.white,
                ),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
