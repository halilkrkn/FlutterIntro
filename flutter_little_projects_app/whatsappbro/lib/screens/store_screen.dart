import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text('''Hele Hele Hele''', Colors.red),
      StoryItem.pageImage(NetworkImage(
          "https://images.unsplash.com/photo-1541233349642-6e425fe6190e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")),
           StoryItem.pageImage(NetworkImage(
          "https://avatars1.githubusercontent.com/u/42476890?s=400&u=01d9c5f068901e1cbd02c32b00e6a07c69d7af73&v=4")),
      StoryItem.pageGif(
          "https://techcrunch.com/wp-content/uploads/2015/08/safe_image.gif",
          imageFit: BoxFit.contain)
    ];
    return Material(
      child: StoryView(
        storyItems,
        controller: controller,
        inline: false,
        repeat: true,
      ),
    );
  }
}