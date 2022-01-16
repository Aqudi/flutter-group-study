import 'package:flutter/material.dart';
import 'package:newtalk/models/chatting_message.dart';
import 'package:newtalk/pages/friend/widgets/profile_avatar.dart';

class ChattingListTile extends StatelessWidget {
  final String name;
  final void Function() onTap;
  final ChattingMessage? recentMessage;

  const ChattingListTile({
    Key? key,
    required this.name,
    required this.onTap,
    this.recentMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 20.0;

    return ListTile(
      contentPadding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 15,
      ),
      horizontalTitleGap: 20,
      leading: const SizedBox(
        height: double.infinity,
        child: ProfileAvatar(size: size),
      ),
      onTap: onTap,
      title: Text(
        name,
        style: const TextStyle(
          fontSize: size,
        ),
      ),
      subtitle: recentMessage == null ? null : Text(recentMessage!.text),
    );
  }
}
