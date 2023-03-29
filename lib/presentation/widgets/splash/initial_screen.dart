import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialScreen extends StatelessWidget {
  final bool charactersListIsEmpty;
  const InitialScreen({super.key, required this.charactersListIsEmpty});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            'assets/images/bg.jpg',
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.6),
            colorBlendMode: BlendMode.darken,
          ),
        ),
        FadeIn(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/marvel_logo.png',
                    width: 300,
                  ),
                ),
                const Text(
                  'A world Full of Heroes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1.0),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Comics, events, series and stories ',
                  textAlign: TextAlign.center,
                  style: TextStyle(letterSpacing: 2.5, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 22,
                ),
                (charactersListIsEmpty)
                    ? const SizedBox(
                        height: 40,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : FadeInUp(
                        child: SizedBox(
                            height: 40, width: double.infinity, child: FilledButton.tonal(onPressed: () => context.go('/home'), child: const Text('Ingresar'))))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
