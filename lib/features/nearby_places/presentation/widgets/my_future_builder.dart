import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyFutureBuilder<T> extends StatelessWidget {
  const MyFutureBuilder({super.key, required this.child, required this.future});

  final Widget Function(T? data) child;
  final Future<T> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        return Skeletonizer(
          enabled:
              snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData ||
              snapshot.data == null,
          child: child.call(snapshot as T),
        );
      },
    );
  }
}
