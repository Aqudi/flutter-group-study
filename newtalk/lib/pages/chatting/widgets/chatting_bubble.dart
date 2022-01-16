import 'package:flutter/material.dart';
import 'package:newtalk/models/chatting_message.dart';

class ChattingBubble extends StatelessWidget {
  final bool isMe;
  final bool isNotContinued;
  final ChattingMessage? message;

  const ChattingBubble({
    Key? key,
    required this.isMe,
    required this.message,
    this.isNotContinued = true,
  }) : super(key: key);

  _buildAvatar() {
    // me는 avatar를 그리지 않는다.
    return isMe
        ? const SizedBox()
        : Opacity(
            opacity: isNotContinued ? 1 : 0,
            child: const Padding(
              padding: EdgeInsets.only(right: 5),
              child: CircleAvatar(
                child: Icon(Icons.person, size: 30),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final color = isMe ? Colors.green.shade300 : Colors.grey.shade300;
    const containerPadding = EdgeInsets.only(top: 5, bottom: 5);

    return Padding(
      padding: containerPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    '${message?.text}',
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
