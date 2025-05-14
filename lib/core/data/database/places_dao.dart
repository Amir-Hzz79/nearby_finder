import 'package:drift/drift.dart';

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

  Future<void> clearPlaces() => delete(placesTable).go();
}
