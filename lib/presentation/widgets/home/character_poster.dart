import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_heroes/domain/entitites/character_entity.dart';

class CharacterPoster extends StatelessWidget {
  final CharacterEntity characterData;
  const CharacterPoster({super.key, required this.characterData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.push('/detail?id=${characterData.id}&image_path=${characterData.imagePath}&character_name=${characterData.name}'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeIn(
            duration: const Duration(seconds: 2),
            child: Image.network(characterData.imagePath),
          ),
        ));
  }
}
