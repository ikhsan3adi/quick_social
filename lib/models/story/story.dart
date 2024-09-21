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
          storyImage: faker.image.loremPicsum(
            random: Random().nextInt(10),
            height: 640,
            width: 360,
          ),
          caption: faker.lorem.sentence(),
        );
      },
    );
  }
}
