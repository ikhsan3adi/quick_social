import 'package:flutter/material.dart';
import 'package:quick_social/models/models.dart';
import 'package:quick_social/widgets/widgets.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(comment.owner.profileImage),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      comment.owner.username,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      comment.body,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _CommentLikeButton(likeCount: comment.likeCount),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CommentLikeButton extends StatefulWidget {
  const _CommentLikeButton({this.likeCount = 122});

  final int likeCount;

  @override
  State<_CommentLikeButton> createState() => _CommentLikeButtonState();
}

class _CommentLikeButtonState extends State<_CommentLikeButton> {
  bool _isLiked = false;
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.likeCount;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PostButton(
      icon: Icon(
        _isLiked ? Icons.favorite : Icons.favorite_outline,
        color: _isLiked ? theme.colorScheme.primary : null,
        size: 18,
      ),
      padding: const EdgeInsets.only(top: 2, right: 2, bottom: 2),
      text: _count.toString(),
      onTap: () => setState(() {
        _isLiked = !_isLiked;
        _isLiked ? _count++ : _count--;
      }),
    );
  }
}
