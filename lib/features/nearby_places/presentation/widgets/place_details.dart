import 'package:flutter/material.dart';
import 'package:nearby_finder/core/models/place_model.dart';
import 'package:nearby_finder/features/nearby_places/presentation/widgets/detail_tile.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({super.key, required this.place});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DetailTile(title: 'Name', value: Text(place.name)),
        DetailTile(title: 'Category', value: Text(place.categoryName)),
        DetailTile(title: 'Address', value: Text(place.address)),
        DetailTile(title: 'Status', value: Text(place.status)),
        DetailTile(title: 'Distance', value: Text('${place.distance}m')),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FilledButton.tonal(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Ok'),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
