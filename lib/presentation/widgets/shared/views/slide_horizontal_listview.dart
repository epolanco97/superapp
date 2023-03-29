import 'package:animate_do/animate_do.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';

class SlideHorizontalListView extends StatelessWidget {
  final String title;
  final List<dynamic> data;
  final bool? onTap;

  const SlideHorizontalListView({super.key, required this.data, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FadeInLeft(
              child: Text(
                title,
                style: titleStyle!.copyWith(fontWeight: FontWeight.bold, letterSpacing: 3.0),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInRight(
                child: _Slide(
                  data: data[index],
                  onTap: onTap,
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final dynamic data;
  final bool? onTap;
  const _Slide({required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleSmall;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                data.imagePath,
                fit: BoxFit.cover,
                width: 150,
                height: 200,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const SizedBox(
                      height: 200,
                      child: Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 2,
                      )),
                    );
                  }
                  return FadeIn(child: GestureDetector(onTap: (onTap != null) ? () => onTapSlide(context, data.description) : null, child: child));
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Text(
              data.name,
              maxLines: 2,
              style: titleStyle,
            ),
          )
        ],
      ),
    );
  }

  void onTapSlide(BuildContext context, String description) {
    final textStyle = Theme.of(context).textTheme;
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Description',
                      style: textStyle.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close,
                          size: 16,
                        ))
                  ],
                ),
                Html(
                  data: description,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
