import 'dart:math';

import 'package:faker/faker.dart';

class User {
  final String profileImage;
  final String bannerImage;
  final String username;
  final String fullname;
  final String bio;
  final int followersCount;
  final int followingCount;
  final bool isMe;

  const User({
    required this.profileImage,
    required this.bannerImage,
    required this.username,
    required this.fullname,
    required this.bio,
    required this.followersCount,
    required this.followingCount,
    this.isMe = false,
  });

  static final List<User> dummyUsers = List.generate(
    5,
    (index) {
      final Faker faker = Faker();
      return User(
        isMe: index == 0,
        profileImage: faker.image.image(
          random: true,
          width: 640,
          height: 640,
          keywords: ['people'],
        ),
        bannerImage: faker.image.image(
          random: true,
          width: 640,
          height: 480,
          keywords: ['nature', 'city'],
        ),
        username: faker.internet.userName(),
        fullname: faker.person.name(),
        bio: faker.lorem.sentence(),
        followersCount: Random().nextInt(1000),
        followingCount: Random().nextInt(1000),
      );
    },
  );
}
