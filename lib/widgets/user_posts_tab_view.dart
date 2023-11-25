import 'package:flutter/material.dart';
import 'package:quick_social/common/responsive_context_extension.dart';
import 'package:quick_social/models/models.dart';

class UserPostsTabView extends StatelessWidget {
  const UserPostsTabView({
    super.key,
    required this.posts,
  });

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Posts'),
              Tab(text: 'Tagged'),
            ],
          ),
          SizedBox(
            height: context.isMobile
                ? (context.width / 3) * (posts.length / 3).ceil() + 16
                : (context.width * .234) * (posts.length / 3).ceil(),
            child: TabBarView(
              children: [
                _postsGridView(context),
                _postsGridView(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _postsGridView(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      shrinkWrap: true,
      itemCount: posts.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            posts[index].postImage,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
