import '../data/database/database.dart';
import 'location.dart';

class PlaceModel {
  final String id;
  final String name;
  final int distance;
  final String categoryName;
  final String categoryIconUrl;
  final String address;
  final Location location;
  final String status;

  PlaceModel({
    required this.id,
    required this.name,
    required this.distance,
    required this.categoryName,
    required this.categoryIconUrl,
    required this.address,
    required this.location,
    required this.status,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    final category =
        json['categories']?.isNotEmpty == true ? json['categories'][0] : null;

    final iconUrl =
        category != null
            ? '${category['icon']['prefix']}64${category['icon']['suffix']}'
            : '';

    final location = json['location'] ?? {};
    final geocodes = json['geocodes']?['main'] ?? {};

    return PlaceModel(
      id: json['fsq_id'] ?? '',
      name: json['name'] ?? '',
      distance: json['distance'] ?? 0,
      categoryName: category?['name'] ?? 'Unknown',
      categoryIconUrl: iconUrl,
      address: location['formatted_address'] ?? 'No address',
      location: Location(
        latitude: geocodes['latitude']?.toDouble() ?? 0.0,
        longitude: geocodes['longitude']?.toDouble() ?? 0.0,
      ),
      status: json['closed_bucket'] ?? 'Unknown',
    );
  }

  factory PlaceModel.fromEntity(PlacesTableData entity) {
    return PlaceModel(
      id: entity.id,
      name: entity.name,
      distance: entity.distance,
      categoryName: entity.categoryName,
      categoryIconUrl: entity.categoryIconUrl,
      address: entity.address,
      location: Location(
        latitude: entity.latitude,
        longitude: entity.longitude,
      ),
      status: entity.status,
    );
  }
}
