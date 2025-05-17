import 'dart:math';

import 'package:drift/drift.dart';

import '../../models/location.dart';
import '../../models/place_model.dart';
import 'database.dart';
import 'place_table.dart';

part 'places_dao.g.dart';

@DriftAccessor(tables: [PlacesTable])
class PlacesDao extends DatabaseAccessor<PlacesDatabase> with _$PlacesDaoMixin {
  PlacesDao(super.db);

  Future<void> insertPlaces(List<PlaceModel> places) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        placesTable,
        places.map((place) {
          return PlacesTableCompanion.insert(
            id: place.id,
            name: place.name,
            categoryName: place.categoryName,
            categoryIconUrl: place.categoryIconUrl,
            status: place.status,
            latitude: place.location.latitude,
            longitude: place.location.longitude,
            address: place.address,
            distance: place.distance,
          );
        }).toList(),
      );
    });
  }

  Future<List<PlaceModel>> getAllPlaces() async {
    final rows = await select(placesTable).get();
    return rows.map((row) => PlaceModel.fromEntity(row)).toList();
  }

  Future<List<PlaceModel>> getAllNearbyPlaces(
    Location currentLocation,
    int radiusInMeters,
  ) async {
    final radiusInKm = radiusInMeters / 1000;

    final lat = currentLocation.latitude;
    final lon = currentLocation.longitude;

    final deltaLat = radiusInKm / 111;
    final deltaLon = radiusInKm / (111 * cos(lat * pi / 180));

    final minLat = lat - deltaLat;
    final maxLat = lat + deltaLat;
    final minLon = lon - deltaLon;
    final maxLon = lon + deltaLon;

    final query = select(placesTable)..where(
      (tbl) =>
          tbl.latitude.isBiggerOrEqualValue(minLat) &
          tbl.latitude.isSmallerOrEqualValue(maxLat) &
          tbl.longitude.isBiggerOrEqualValue(minLon) &
          tbl.longitude.isSmallerOrEqualValue(maxLon),
    );

    final results = await query.get();

    final List<PlaceModel> allplaces =
        results.map((row) => PlaceModel.fromEntity(row)).toList();

    return allplaces
        .where(
          (place) => currentLocation.distance(place.location) <= radiusInKm,
        )
        .toList();
  }

  Future<void> clearPlaces() => delete(placesTable).go();
}
