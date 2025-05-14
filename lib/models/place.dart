class Place {
  final String id;
  final String name;
  final int distance;
  final String categoryName;
  final String categoryIconUrl;
  final String address;
  final double latitude;
  final double longitude;
  final String status;

  Place({
    required this.id,
    required this.name,
    required this.distance,
    required this.categoryName,
    required this.categoryIconUrl,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.status,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    final category =
        json['categories']?.isNotEmpty == true ? json['categories'][0] : null;

    final iconUrl =
        category != null
            ? '${category['icon']['prefix']}64${category['icon']['suffix']}'
            : '';

    final location = json['location'] ?? {};
    final geocodes = json['geocodes']?['main'] ?? {};

    return Place(
      id: json['fsq_id'] ?? '',
      name: json['name'] ?? '',
      distance: json['distance'] ?? 0,
      categoryName: category?['name'] ?? 'Unknown',
      categoryIconUrl: iconUrl,
      address: location['formatted_address'] ?? 'No address',
      latitude: geocodes['latitude']?.toDouble() ?? 0.0,
      longitude: geocodes['longitude']?.toDouble() ?? 0.0,
      status: json['closed_bucket'] ?? 'Unknown',
    );
  }
}
