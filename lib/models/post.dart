import 'dart:math';

import 'package:faker/faker.dart';
import 'package:quick_social/models/models.dart';

class Post {
  final User owner;
  final String postImage;
  final String location;
  final String caption;
  final List<Comment> comments;
  final int likeCount;
  final int saveCount;
  final bool isLiked;
  final bool isSaved;

  const Post({
    required this.owner,
    required this.postImage,
    required this.location,
    required this.caption,
    required this.comments,
    required this.likeCount,
    required this.saveCount,
    this.isLiked = false,
    this.isSaved = false,
  });

  static final List<Post> dummyPosts = List.generate(
    30,
    (index) {
      final Faker faker = Faker();
      return Post(
        owner: User.dummyUsers[
            index > 15 ? 0 : Random().nextInt(User.dummyUsers.length - 1)],
        postImage: faker.image.image(
          random: true,
          height: 640,
          width: 640,
          keywords: ['nature', 'city'],
        ),
        location: '${faker.address.city()}, ${faker.address.country()}',
        caption: faker.lorem.sentence(),
        comments: Comment.generateDummyComments(),
        likeCount: Random().nextInt(1000),
        saveCount: Random().nextInt(1000),
      );
    },
  );
}
