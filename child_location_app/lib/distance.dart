import 'dart:math';
import 'package:geolocator/geolocator.dart';

double _toRad(double deg) => deg * pi / 180.0;

double haversine(double lat1, double lon1, double lat2, double lon2) {
  const R = 6371000.0; // meters
  final dLat = _toRad(lat2 - lat1);
  final dLon = _toRad(lon2 - lon1);
  final a = sin(dLat/2) * sin(dLat/2) +
      cos(_toRad(lat1)) * cos(_toRad(lat2)) *
          sin(dLon/2) * sin(dLon/2);
  final c = 2 * atan2(sqrt(a), sqrt(1-a));
  return R * c;
}

class DistanceTracker {
  Position? _last;
  double totalMeters = 0.0;

  void addPosition(Position pos) {
    if (_last != null) {
      final d = haversine(
          _last!.latitude, _last!.longitude,
          pos.latitude, pos.longitude
      );
      if (d > 5) totalMeters += d; // ignore jitter
    }
    _last = pos;
  }
}
