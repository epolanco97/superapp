import 'package:flutter/material.dart';

class LinearGradientContainer extends StatelessWidget {
  final List<Color> colors;
  final Alignment? begin;
  final Alignment? end;
  final List<double>? stops;
  const LinearGradientContainer({super.key, required this.colors, this.begin, this.end, this.stops});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: stops,
            colors: colors,
            end: end ?? Alignment.centerRight,
            begin: begin ?? Alignment.centerLeft,
          ),
        ),
      ),
    );
  }
}
