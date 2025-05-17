import 'package:nearby_finder/core/models/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationPrefrenceService {
  final _keyLatitude = 'latitude';
  final _keyLongitude = 'longitude';

  Future<void> saveLocation(Location location) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyLatitude, location.latitude);
    await prefs.setDouble(_keyLongitude, location.longitude);
  }

  Future<Location?> getSavedLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final latitude = prefs.getDouble(_keyLatitude);
    final longitude = prefs.getDouble(_keyLongitude);

    if (latitude != null && longitude != null) {
      return Location(latitude: latitude, longitude: longitude);
    }
    
    return null;
  }

  Future<void> clearLocation() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyLatitude);
    await prefs.remove(_keyLongitude);
  }
}
