import 'dart:math';

import 'package:faker/faker.dart';

class Story {
  final String storyImage;
  final String caption;

  const Story({
    required this.storyImage,
    required this.caption,
  });

  static List<Story> generateDummyStories() {
    return List.generate(
      Random().nextInt(6) + 1,
      (index) {
        final Faker faker = Faker();
        return Story(
          storyImage: faker.image.image(
            random: true,
            height: 640,
            width: 360,
            keywords: ['nature', 'city'],
          ),
          caption: faker.lorem.sentence(),
        );
      },
    );
  }
}
