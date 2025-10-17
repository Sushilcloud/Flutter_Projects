import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParentScreen extends StatefulWidget {
  @override
  _ParentScreenState createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  String childUid = "child_uid_here"; // Replace with your child's UID
  LatLng? childLoc;

  void getChildLocation() {
    FirebaseDatabase.instance
        .reference()
        .child('locations/$childUid')
        .onValue
        .listen((event) {
      var data = event.snapshot.value;
      if (data != null) {
        final locMap = data as Map<dynamic, dynamic>;
        if (locMap['latitude'] != null && locMap['longitude'] != null) {
          double latitude = locMap['latitude'] * 1.0;
          double longitude = locMap['longitude'] * 1.0;
          setState(() {
            childLoc = LatLng(latitude, longitude);
          });
        }
      }
    });
  }


  @override
  void initState() {
    super.initState();
    getChildLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Child Location")),
      body: childLoc == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: childLoc!, // Non-null assertion after null check
          zoom: 17,
        ),
        markers: {
          Marker(markerId: MarkerId("child"), position: childLoc!),
        },
      ),
    );
  }
}
