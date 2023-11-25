import 'package:flutter/material.dart';
import 'package:quick_social/models/models.dart';

class UserStoryAvatar extends StatelessWidget {
  const UserStoryAvatar({
    super.key,
    required this.userStory,
    required this.onTap,
  });

  final UserStory userStory;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.fromSize(
          size: const Size.square(65),
          child: const CircularProgressIndicator(
            value: 1,
            strokeWidth: 2,
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(userStory.owner.profileImage),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: theme.colorScheme.primary.withAlpha(50),
              borderRadius: BorderRadius.circular(100),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
