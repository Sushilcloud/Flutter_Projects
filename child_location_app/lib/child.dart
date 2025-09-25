import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChildApp extends StatefulWidget {
  final String childId;
  final String childName;

  const ChildApp({super.key, required this.childId, required this.childName});

  @override
  State<ChildApp> createState() => _ChildAppState();
}

class _ChildAppState extends State<ChildApp> {
  Position? _currentPosition;
  String _statusMessage = "Waiting for location...";
  Stream<Position>? _positionStream;

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndStart();
  }

  Future<void> _checkPermissionsAndStart() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("Location service enabled: $serviceEnabled");

    if (!serviceEnabled) {
      setState(() {
        _statusMessage =
        "Location services are disabled. Please enable them.";
      });
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      setState(() {
        _statusMessage = "Location permission denied.";
      });
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _statusMessage =
        "Location permission permanently denied. Enable from settings.";
      });
      return;
    }

    _startLocationUpdates();
  }

  void _startLocationUpdates() {
    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );

    _positionStream!.listen((Position position) async {
      print('Location received: ${position.latitude}, ${position.longitude}');
      if (!mounted) return;
      setState(() {
        _currentPosition = position;
        _statusMessage = "Location received!";
      });

      try {
        // Write location + name to Firestore
        await FirebaseFirestore.instance
            .collection('children')
            .doc(widget.childId)
            .set({
          'lat': position.latitude,
          'lng': position.longitude,
          'name': widget.childName,
          'timestamp': FieldValue.serverTimestamp(),
        });

        // Optional: keep location history
        await FirebaseFirestore.instance
            .collection('children')
            .doc(widget.childId)
            .collection('locations')
            .add({
          'lat': position.latitude,
          'lng': position.longitude,
          'timestamp': FieldValue.serverTimestamp(),
        });
      } catch (e) {
        print('Error saving location: $e');
      }
    }, onError: (e) {
      print('Location stream error: $e');
      setState(() {
        _statusMessage = "Error getting location: $e";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Child App: ${widget.childName}")),
      body: Center(
        child: _currentPosition == null
            ? Text(_statusMessage)
            : Text(
            "Lat: ${_currentPosition!.latitude}, Lng: ${_currentPosition!.longitude}"),
      ),
    );
  }
}
