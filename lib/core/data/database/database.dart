import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

import 'places_dao.dart';
import 'place_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [PlacesTable], daos: [PlacesDao])
class PlacesDatabase extends _$PlacesDatabase {
  PlacesDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final dbFolderPath = '${dbFolder.path}/database';
      final file = File('$dbFolderPath/places.sqlite');

      // Ensure the directory exists
      if (!(await Directory(dbFolderPath).exists())) {
        await Directory(dbFolderPath).create(recursive: true);
      }

      return NativeDatabase(file);
    });
  }
}
