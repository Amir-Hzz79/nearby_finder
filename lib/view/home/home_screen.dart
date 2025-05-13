import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/theme_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            IconButton(
              icon: Icon(
                ref.watch(themeModeProvider) == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed:
                  () => ref.read(themeModeProvider.notifier).toggleTheme(),
            ),
          ],
        ),
        body: const SizedBox(),
      ),
    );
  }
}
