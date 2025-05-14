import 'package:flutter/material.dart';

import '../../models/place.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(place.categoryIconUrl),
      title: Text(place.name),
      subtitle: Text(place.categoryName),
      trailing: Text('${place.distance}m'),
    );
  }
}
