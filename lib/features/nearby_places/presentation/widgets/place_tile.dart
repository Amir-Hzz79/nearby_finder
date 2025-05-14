import 'package:flutter/material.dart';
import 'package:nearby_finder/view/widgets/detail_tile.dart';

import '../../models/place.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile({super.key, required this.place});

  final Place place;

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
                      const SizedBox(height: 16),
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
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: Text(place.name),
        subtitle: Text(place.categoryName),
        trailing: Text('${place.distance}m'),
      ),
    );
  }
}
