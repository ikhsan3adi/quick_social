import 'package:flutter/material.dart';
import 'package:quick_social/common/common.dart';
import 'package:quick_social/models/models.dart';
import 'package:quick_social/pages/pages.dart';
import 'package:quick_social/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    super.key,
    required this.user,
    this.isNavigatorPushed = false,
  })  : story = UserStory.dummyUserStories.firstWhere((e) => e.owner == user),
        posts = Post.dummyPosts.where((e) => e.owner == user).toList();

  static MaterialPageRoute route(User user) => MaterialPageRoute(
        builder: (_) => ProfilePage(user: user, isNavigatorPushed: true),
      );

  final bool isNavigatorPushed;

  final UserStory story;
  final User user;
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(context),
      body: ResponsivePadding(
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          children: [
            _bannerAndProfilePicture(context),
            _userBio(context),
            UserPostsTabView(posts: posts),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      flexibleSpace: ResponsivePadding(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isNavigatorPushed
                    ? IconButton.filledTonal(
                        onPressed: () => context.pop(),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              theme.colorScheme.primary.withAlpha(75),
                        ),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox(),
                IconButton.filledTonal(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary.withAlpha(75),
                  ),
                  icon: Icon(
                    user.isMe ? Icons.settings : Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bannerAndProfilePicture(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints.expand(height: 200),
              child: Image.network(
                user.bannerImage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        user.followersCount.toString(),
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('Followers'),
                    ],
                  ),
                  const SizedBox(width: 48),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        user.followingCount.toString(),
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('Following'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 20,
          width: 100,
          height: 100,
          child: FittedBox(
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: UserStoryAvatar(
                userStory: story,
                onTap: () => context.push(
                  route: UserStoryPage.route(0, userStories: [story]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _userBio(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            user.fullname,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('@${user.username}', style: textTheme.bodyMedium),
          const SizedBox(height: 4),
          Text(
            user.bio,
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          user.isMe ? const SizedBox(height: 24) : _profileButtons(),
        ],
      ),
    );
  }

  Widget _profileButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilledButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text('Follow'),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
              child: Text('Message'),
            ),
          ),
        ],
      ),
    );
  }
}
