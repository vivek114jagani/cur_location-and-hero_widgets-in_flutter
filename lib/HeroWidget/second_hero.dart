// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class HeroWidget1 extends StatefulWidget {
  const HeroWidget1({super.key});

  @override
  State<HeroWidget1> createState() => _HeroWidget1State();
}

class _HeroWidget1State extends State<HeroWidget1>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        flightShuttleBuilder: (
          BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext,
        ) {
          return const RefreshProgressIndicator();
        },
        placeholderBuilder: (context, heroSize, child) {
          return const CircularProgressIndicator(
            // strokeWidth: 100,
            value: 10,
          );
        },
        createRectTween: (begin, end) {
          // return MaterialRectCenterArcTween(begin: begin, end: end);
          return CustomRectTween(begin: begin, end: end);
        },
        transitionOnUserGestures: true,
        tag: 'addIcon',
        child: const Icon(
          Icons.add,
          size: 70.0,
        ),
      ),
    );
  }
}

class CustomRectTween extends RectTween {
  @override
  final Rect? begin;
  @override
  final Rect? end;

  CustomRectTween({required this.begin, required this.end})
      : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    double x = Curves.easeOutCirc.transform(t);

    return Rect.fromLTRB(
      lerpDouble(begin!.left, end!.left, t),
      lerpDouble(begin!.top, end!.top, t),
      lerpDouble(begin!.right, end!.right, t) * (1 + x),
      lerpDouble(begin!.bottom, end!.bottom, t) * (1 + x),
    );
  }

  double lerpDouble(num begin, num end, double t) {
    return begin + (end - begin) * t;
  }
}
