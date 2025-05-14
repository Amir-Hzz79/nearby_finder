import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
  const DetailTile({super.key, required this.title, required this.value});

  final String title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 1, child: Text(title, style: TextStyle(fontSize: 14))),
          Flexible(flex: 2, child: value),
        ],
      ),
    );
  }
}
