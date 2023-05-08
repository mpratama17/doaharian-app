import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';

class Loc extends StatefulWidget {
  const Loc({super.key});

  @override
  // _Loc createState() => _Locs();

  State<Loc> createState() => _LocState();
}

class _LocState extends State<Loc> {
  var locationMessage = "";
  void getCurrentLocation() async {
    var postition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);

    setState(() {
      locationMessage = "${postition.latitude}, ${postition.longitude}";
      // locationMessage = "$postition.latitude, $postition.longitude";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text(locationMessage)),
            SizedBox(height: 20),
            Text("Get user location"),
            ElevatedButton(
              onPressed: () {
                getCurrentLocation();
              },
              child: Text("Get location"),
            ),
          ],
        )),
      ),
    );
  }
}
