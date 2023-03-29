import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_heroes/presentation/providers/providers.dart';
import 'package:super_heroes/presentation/widgets/shared/appbars/custom_sliver_appbar.dart';
import 'package:super_heroes/presentation/widgets/shared/views/slide_horizontal_listview.dart';
import 'package:super_heroes/presentation/widgets/shared/views/text_horizontal_listview.dart';

class CharacterScreen extends ConsumerStatefulWidget {
  final int characterID;
  final String imagePath;
  final String characterName;

  static const name = 'character-screen';

  const CharacterScreen({super.key, required this.characterID, required this.imagePath, required this.characterName});

  @override
  CharacterScreenState createState() => CharacterScreenState();
}

class CharacterScreenState extends ConsumerState<CharacterScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(getComicsProvider.notifier).loadComics(characterID: widget.characterID);
    ref.read(getEventsProvider.notifier).loadEvents(characterID: widget.characterID);
    ref.read(getSeriesProvider.notifier).loadSeries(characterID: widget.characterID);
    ref.read(getStoriesProvider.notifier).loadStories(characterID: widget.characterID);
  }

  @override
  Widget build(BuildContext context) {
    final comics = ref.watch(getComicsProvider);
    final events = ref.watch(getEventsProvider);
    final series = ref.watch(getSeriesProvider);
    final stories = ref.watch(getStoriesProvider);

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            imagePath: widget.imagePath,
            characterName: widget.characterName,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) {
                if (comics.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 14),
                          Text('Cargando...'),
                        ],
                      ),
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    if (comics.isNotEmpty)
                      SlideHorizontalListView(
                        title: 'Comics ',
                        data: comics,
                        onTap: true,
                      ),
                    if (events.isNotEmpty)
                      SlideHorizontalListView(
                        title: 'Events ',
                        data: events,
                        onTap: true,
                      ),
                    if (series.isNotEmpty)
                      SlideHorizontalListView(
                        title: 'Series ',
                        data: series,
                      ),
                    if (stories.isNotEmpty)
                      TextHorizontalListView(
                        itemCount: stories.length,
                        child: (context, index) {
                          final storyData = stories[index];
                          return Container(
                            margin: const EdgeInsets.only(left: 8, right: 2),
                            child: Chip(
                              label: Text(storyData.name),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                          );
                        },
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
