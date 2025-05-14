import 'package:drift/drift.dart';

class PlacesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get distance => integer()();
  TextColumn get categoryName => text()();
  TextColumn get categoryIconUrl => text()();
  TextColumn get address => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get status => text()();

  @override
  Set<Column> get primaryKey => {id};
}
