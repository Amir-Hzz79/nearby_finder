import 'package:flutter/material.dart';
import 'package:nearby_finder/features/nearby_places/presentation/widgets/detail_tile.dart';

import '../../../../core/models/place.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile({super.key, required this.place, this.onTap});

  final Place place;
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
                (context) => IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DetailTile(title: 'Name', value: Text(place.name)),
                      DetailTile(
                        title: 'Category',
                        value: Text(place.categoryName),
                      ),
                      DetailTile(title: 'Address', value: Text(place.address)),
                      DetailTile(title: 'Status', value: Text(place.status)),
                      DetailTile(
                        title: 'Distance',
                        value: Text('${place.distance}m'),
                      ),
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
                  ),
                ),
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
        trailing: TextButton(onPressed: onTap, child: Text('Show on map')),
      ),
    );
  }
}
