import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/models/app_user.dart';
import 'package:newtalk/models/chatting_message.dart';
import 'package:newtalk/widgets/profile_avatar.dart';

enum ChattingBubbleType {
  message,
  notification,
}

class ChattingBubble extends HookConsumerWidget {
  final bool isMe;
  final bool showUsername;
  final bool showAvatar;
  final ChattingMessage? message;
  final ChattingBubbleType type;
  final AppUser? sender;

  const ChattingBubble({
    Key? key,
    required this.message,
    this.isMe = false,
    this.type = ChattingBubbleType.message,
    this.showUsername = false,
    this.showAvatar = false,
    this.sender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = isMe ? Colors.grey.shade300 : Colors.white;
    const containerPadding = EdgeInsets.only(top: 5, bottom: 5);
    const circleAvatarRadius = 20.0;

    // 메시지가 없을 때는 빈 공간을 그린다.
    if (message?.text == null) {
      return const SizedBox();
    }

    List<Widget> children;
    switch (type) {
      case ChattingBubbleType.notification:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Center(
            child: Text(
              '${message?.text}',
              style: TextStyle(
                color: Colors.grey.shade400,
              ),
            ),
          ),
        );
      case ChattingBubbleType.message:
        children = [
          if (!isMe && showAvatar)
            ProfileAvatar(
              size: circleAvatarRadius,
              user: sender,
            ),
          if (!(!isMe && showAvatar))
            const SizedBox(width: circleAvatarRadius * 2),
          const SizedBox(width: 5),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Text(
                '${message?.text}',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),
        ];
        break;
    }

    return Padding(
      padding: containerPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (!isMe && showUsername)
            Row(
              children: [
                const SizedBox(width: circleAvatarRadius * 2 + 17),
                Text(
                  "${sender?.name ?? message?.sendBy}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          const SizedBox(height: 5),
          Row(
            // 상대방: 왼쪽, 나: 오른쪽 정렬
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ],
      ),
    );
  }
}
