import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParentApp extends StatefulWidget {
  const ParentApp({super.key});

  @override
  State<ParentApp> createState() => _ParentAppState();
}

class _ParentAppState extends State<ParentApp> {
  GoogleMapController? _mapController;
  final Map<String, Marker> _markers = {}; // childId -> Marker

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parent App - Live Children")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('children').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;
          if (docs.isEmpty) {
            return const Center(child: Text("No children found"));
          }

          LatLngBounds? bounds;

          // Update markers for all children
          for (var doc in docs) {
            final data = doc.data() as Map<String, dynamic>;
            if (!data.containsKey('lat') || !data.containsKey('lng')) continue;

            final LatLng pos = LatLng(data['lat'], data['lng']);
            _markers[doc.id] = Marker(
              markerId: MarkerId(doc.id),
              position: pos,
              infoWindow: InfoWindow(title: data['name'] ?? doc.id),
            );

            // Update bounds to include this marker
            if (bounds == null) {
              bounds = LatLngBounds(southwest: pos, northeast: pos);
            } else {
              bounds = LatLngBounds(
                southwest: LatLng(
                  bounds.southwest.latitude < pos.latitude
                      ? bounds.southwest.latitude
                      : pos.latitude,
                  bounds.southwest.longitude < pos.longitude
                      ? bounds.southwest.longitude
                      : pos.longitude,
                ),
                northeast: LatLng(
                  bounds.northeast.latitude > pos.latitude
                      ? bounds.northeast.latitude
                      : pos.latitude,
                  bounds.northeast.longitude > pos.longitude
                      ? bounds.northeast.longitude
                      : pos.longitude,
                ),
              );
            }
          }

          // Move camera to include all markers
          if (_mapController != null && bounds != null) {
            _mapController!.animateCamera(
              CameraUpdate.newLatLngBounds(bounds, 100),
            );
          }

          return GoogleMap(
            onMapCreated: (controller) => _mapController = controller,
            initialCameraPosition: CameraPosition(
              target: _markers.values.first.position,
              zoom: 14,
            ),
            markers: _markers.values.toSet(),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          );
        },
      ),
    );
  }
}
