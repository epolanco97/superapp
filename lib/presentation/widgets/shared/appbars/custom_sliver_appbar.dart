import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:super_heroes/presentation/widgets/shared/containers/linear_gradient_container.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String imagePath;
  final String characterName;
  const CustomSliverAppBar({
    super.key,
    required this.imagePath,
    required this.characterName,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.70,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        title: FadeInUp(
          child: Text(
            characterName,
            style: const TextStyle(fontSize: 20, letterSpacing: 3.0),
            textAlign: TextAlign.start,
          ),
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const LinearGradientContainer(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 1.0],
              colors: [Colors.transparent, Colors.black87],
            ),
            const LinearGradientContainer(
              begin: Alignment.topLeft,
              stops: [0.0, 0.4],
              colors: [
                Colors.black87,
                Colors.transparent,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
