import 'package:flutter/material.dart';

import '../../models/place.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    Image image = Image.network(place.categoryIconUrl);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          ModalBottomSheetRoute(
            showDragHandle: true,
            enableDrag: true,
            builder:
                (context) => IntrinsicHeight(
                  child: Column(
                    children: [
                      ListTile(title: Text('Name'), trailing: Text(place.name)),
                      ListTile(
                        title: Text('Category'),
                        trailing: Text(place.categoryName),
                      ),
                      ListTile(title: Text('Icon'), trailing: image),
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /* const SizedBox(width: 10), */
                            Flexible(
                              child: Text(
                                'Address',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Flexible(child: Text(place.address)),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text('Status'),
                        trailing: Text(place.status),
                      ),
                      ListTile(
                        title: Text('Distance'),
                        trailing: Text('${place.distance}m'),
                      ),
                    ],
                  ),
                ),
            isScrollControlled: true,
          ),
        );
      },
      child: ListTile(
        leading: image,
        title: Text(place.name),
        subtitle: Text(place.categoryName),
        trailing: Text('${place.distance}m'),
      ),
    );
  }
}
