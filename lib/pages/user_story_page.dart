import 'package:flutter/material.dart';
import 'package:quick_social/models/models.dart';
import 'package:quick_social/widgets/widgets.dart';
import 'package:story/story_page_view.dart';

class UserStoryPage extends StatelessWidget {
  const UserStoryPage({
    super.key,
    required this.initialIndex,
    required this.userStories,
  });

  static MaterialPageRoute route(
    int initialIndex, {
    List<UserStory>? userStories,
  }) =>
      MaterialPageRoute(
        builder: (_) => UserStoryPage(
          initialIndex: initialIndex,
          userStories: userStories ?? UserStory.dummyUserStories,
        ),
      );

  final int initialIndex;
  final List<UserStory> userStories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        initialPage: initialIndex,
        itemBuilder: (_, pageIndex, storyIndex) {
          final UserStory userStory = userStories[pageIndex];
          final Story story = userStory.stories[storyIndex];

          return _storyImage(story);
        },
        gestureItemBuilder: (context, pageIndex, _) {
          final UserStory userStory = userStories[pageIndex];

          return _storyAppBar(context, userStory);
        },
        pageLength: userStories.length,
        storyLength: (pageIndex) => userStories[pageIndex].stories.length,
        onPageLimitReached: () => Navigator.pop(context),
      ),
    );
  }

  Widget _storyAppBar(
    BuildContext context,
    UserStory userStory,
  ) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 38, bottom: 8),
        color: Colors.black45,
        child: Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              color: Colors.white,
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.pop(context),
            ),
            Flexible(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    userStory.owner.profileImage,
                  ),
                ),
                title: Text(
                  userStory.owner.username,
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _storyImage(Story story) {
    return Container(
      color: Colors.black87,
      child: Stack(
        children: [
          Positioned.fill(
            child: ResponsivePadding(
              child: Image.network(
                story.storyImage,
                fit: BoxFit.contain,
                loadingBuilder: (ctx, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 96,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              color: Colors.black45,
              child: Center(
                child: Text(
                  story.caption,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
