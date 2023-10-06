import 'package:cur_location/HeroWidget/second_hero.dart';
import 'package:flutter/material.dart';

class HeroWidget extends StatefulWidget {
  const HeroWidget({super.key});

  @override
  State<HeroWidget> createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: const Hero(
            tag: 'addIcon',
            child: Icon(
              Icons.add,
              size: 70.0,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HeroWidget1(),
                ));
          },
        ),
      ),
    );
  }
}
