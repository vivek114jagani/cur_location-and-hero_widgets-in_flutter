// ignore_for_file: avoid_print

import 'dart:async';
import 'package:cur_location/HeroWidget/hero_widget.dart';
import 'package:cur_location/services/location_services.dart';
// import 'package:cur_location/spin_loader.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: Loader(),
      home: const HeroWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Position location;
  @override
  void initState() {
    getState();
    super.initState();
  }

  Future<void> getState() async {
    // Future.delayed(
    //   const Duration(seconds: 2),
    //   () async {
    //     location = await LocationService.determinePosition();
    //     setState(() {});
    //     print(location.latitude);
    //     print(location.longitude);
    //   },
    // );

    Timer.periodic(const Duration(seconds: 3), (timer) async {
      location = await LocationService.determinePosition();
      setState(() {});
      print(location.latitude);
      print(location.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "${location.latitude}",
            ),
            Text(
              "${location.longitude}",
            ),
            Text(
              "${location.timestamp}",
            ),
            Text(
              "${location.accuracy}",
            ),
            Text(
              "${location.floor}",
            ),
          ],
        ),
      ),
    );
  }
}
