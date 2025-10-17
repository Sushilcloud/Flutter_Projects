import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ChildScreen extends StatefulWidget {
  @override
  _ChildScreenState createState() => _ChildScreenState();
}

class _ChildScreenState extends State<ChildScreen> {
  Location location = Location();
  bool sharing = false;

  void startSharing() async {
    sharing = true;
    while (sharing) {
      LocationData locData = await location.getLocation();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;
        FirebaseDatabase.instance.reference().child('locations/$uid').set({
          'latitude': locData.latitude,
          'longitude': locData.longitude,
        });
      }
      await Future.delayed(Duration(seconds: 10));
    }
  }

  void stopSharing() {
    sharing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Child Location")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Start Sharing Location"),
              onPressed: startSharing,
            ),
            ElevatedButton(
              child: Text("Stop Sharing"),
              onPressed: stopSharing,
            ),
          ],
        ),
      ),
    );
  }
}
