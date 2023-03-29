import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MasonryView extends StatelessWidget {
  final Widget Function(BuildContext, int) child;
  final int itemCount;
  const MasonryView({super.key, required this.child, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: itemCount,
      itemBuilder: child,
    );
  }
}
