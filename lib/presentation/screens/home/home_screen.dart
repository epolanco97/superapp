import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_heroes/presentation/providers/providers.dart';
import 'package:super_heroes/presentation/widgets/home/character_poster.dart';
import 'package:super_heroes/presentation/widgets/shared/views/masonry_view.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final charactersList = ref.watch(getCharactersProvider);

    return Scaffold(
      body: SafeArea(
        child: MasonryView(
          itemCount: charactersList.length,
          child: (context, index) {
            return CharacterPoster(
              characterData: charactersList[index],
            );
          },
        ),
      ),
    );
  }
}
