import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.black,
          lineWidth: 4,
          size: 50,
          itemCount: 10,
          controller: AnimationController(
              vsync: this, duration: const Duration(seconds: 5)),
        ),
      ),
    );
  }
}
