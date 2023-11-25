import 'package:flutter/material.dart';
import 'package:quick_social/models/models.dart';
import 'package:quick_social/widgets/widgets.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: _appBar(theme),
      body: ResponsivePadding(
        child: ListView(
          children: [
            SizedBox(
              height: 110,
              child: ListView.builder(
                itemCount: UserStory.dummyUserStories.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 4 : 0,
                      right: index == UserStory.dummyUserStories.length - 1
                          ? 4
                          : 0,
                    ),
                    child: UserStoryTile(index: index),
                  );
                },
              ),
            ),
            ListView.separated(
              itemCount: Post.dummyPosts.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(height: 4),
              ),
              itemBuilder: (context, index) {
                return PostCard(post: Post.dummyPosts[index]);
              },
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar(ThemeData theme) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: ResponsivePadding(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppLogo(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send_sharp,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
