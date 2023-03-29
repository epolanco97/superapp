import 'package:flutter/material.dart';

class TextHorizontalListView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) child;
  const TextHorizontalListView({super.key, required this.itemCount, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Stories',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, letterSpacing: 3.0 ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: child,
            ),
          ),
        ],
      ),
    );
  }
}
