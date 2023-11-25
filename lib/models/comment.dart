import 'dart:math';

import 'package:faker/faker.dart';
import 'package:quick_social/models/models.dart';

class Comment {
  final User owner;
  final String body;
  final int likeCount;

  const Comment({
    required this.owner,
    required this.body,
    required this.likeCount,
  });

  static List<Comment> generateDummyComments() {
    return List.generate(
      Random().nextInt(10),
      (index) {
        return Comment(
          owner: User.dummyUsers[Random().nextInt(User.dummyUsers.length - 1)],
          body: Faker().lorem.sentence(),
          likeCount: Random().nextInt(1000),
        );
      },
    );
  }
}
