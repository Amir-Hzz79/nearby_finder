import 'package:flutter/material.dart';
import 'package:nearby_finder/features/nearby_places/presentation/widgets/place_details.dart';

import '../../../../core/models/place_model.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile({super.key, required this.place, this.onTap});

  final PlaceModel place;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          ModalBottomSheetRoute(
            showDragHandle: true,
            enableDrag: true,
            builder:
                (context) => IntrinsicHeight(child: PlaceDetails(place: place)),
            isScrollControlled: true,
          ),
        );
      },
      child: ListTile(
        leading: Image.network(
          place.categoryIconUrl,
          errorBuilder:
              (context, error, stackTrace) =>
                  Icon(Icons.location_city_rounded, size: 40),
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: Text('${place.name} (${place.distance}m)'),
        subtitle: Text(place.categoryName),
        /* trailing: TextButton(onPressed: onTap, child: Text('Show')), */
      ),
    );
  }
}
