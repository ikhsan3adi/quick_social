import 'package:flutter/material.dart';
import 'package:quick_social/models/models.dart';
import 'package:quick_social/widgets/comment_tile.dart';

class CommentsBottomSheet extends StatefulWidget {
  const CommentsBottomSheet({super.key, required this.post});

  static Future<void> showCommentsBottomSheet(
    BuildContext context, {
    required Post post,
  }) async {
    return await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) => CommentsBottomSheet(post: post),
    );
  }

  final Post post;

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    _comments = widget.post.comments;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 64),
          child: Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            padding: const EdgeInsets.only(bottom: 64),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _comments.length,
              itemBuilder: (_, index) {
                return index == 0
                    ? Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: CommentTile(comment: _comments[index]),
                      )
                    : CommentTile(comment: _comments[index]);
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: _header(theme),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _commentTextField(theme),
        ),
      ],
    );
  }

  Widget _header(ThemeData theme) {
    return SizedBox(
      height: 64,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: theme.dividerColor.withAlpha(100),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              'Comments',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _commentTextField(ThemeData theme) {
    TextEditingController controller = TextEditingController();

    return Container(
      color: theme.colorScheme.secondaryContainer,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: controller,
              autofocus: true,
              onSubmitted: _submitComment,
              decoration: InputDecoration(
                hintText: 'Tulis sesuatu',
                filled: true,
                isDense: true,
                fillColor: theme.colorScheme.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: () {
              if (controller.text.isEmpty) return;
              _submitComment(controller.text);
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  void _submitComment(String text) {
    setState(() {
      _comments.add(
        Comment(
          owner: User.dummyUsers[0],
          body: text,
          likeCount: 0,
        ),
      );
    });
  }
}
