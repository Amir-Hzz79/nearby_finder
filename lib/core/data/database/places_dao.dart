import 'package:drift/drift.dart';

import '../../models/location.dart';
import '../../models/place_model.dart';
import 'database.dart';
import 'place_table.dart';

part 'places_dao.g.dart';

@DriftAccessor(tables: [PlacesTable])
class PlacesDao extends DatabaseAccessor<PlacesDatabase> with _$PlacesDaoMixin {
  PlacesDao(super.db);

  Future<void> insertPlaces(List<PlacesTableCompanion> places) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(placesTable, places);
    });
  }

  Future<List<PlaceModel>> getAllPlaces() async {
    final rows = await select(placesTable).get();
    return rows.map((row) => PlaceModel.fromEntity(row)).toList();
  }

  Future<void> clearPlaces() => delete(placesTable).go();
}
