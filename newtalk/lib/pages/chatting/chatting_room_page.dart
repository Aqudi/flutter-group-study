import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:newtalk/models/chatting_message.dart';
import 'package:newtalk/pages/chatting/widgets/chatting_bubble.dart';
import 'package:newtalk/services/auth_service.dart';
import 'package:newtalk/services/chatting_room_service.dart';
import 'package:newtalk/widgets/base_scaffold.dart';

class ChattingRoomPage extends HookConsumerWidget {
  final String? name;

  const ChattingRoomPage({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider);
    final chattingRoomService = ref.read(chattingRoomServiceProvider);
    final controller = useTextEditingController();

    final buildMessageList = useCallback(() {
      return Expanded(
        child: StreamBuilder(
          stream: chattingRoomService.getMessages(),
          builder: (_context,
              AsyncSnapshot<QuerySnapshot<ChattingMessage>> snapshot) {
            List<Widget> children;
            if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('Stack trace: ${snapshot.stackTrace}'),
                ),
              ];
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                  ];
                  break;
                case ConnectionState.active:
                case ConnectionState.done:
                  final docsSize = snapshot.data?.size ?? 0;
                  final docs = snapshot.data?.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 10,
                      right: 10,
                    ),
                    itemCount: docsSize,
                    itemBuilder: (context, index) {
                      final message = docs?[index].data();
                      final nextMessage = (docsSize <= (index + 1))
                          ? null
                          : docs?[index + 1].data();
                      final prevMessage =
                          (0 > (index - 1)) ? null : docs?[index - 1].data();

                      final isMe = message?.sendBy == authService.user.uid;
                      final isNotification =
                          message?.type == ChattingMessageType.notification;
                      final isPrevNotification =
                          prevMessage?.type == ChattingMessageType.notification;

                      final showAvatar = !isNotification &&
                          !isMe &&
                          (message?.sendBy != prevMessage?.sendBy);

                      final showUsername = isPrevNotification ||
                          (!isNotification &&
                              !isMe &&
                              (message?.sendBy != nextMessage?.sendBy));

                      bool showTime = false;
                      if (nextMessage?.createdAt != null &&
                          message?.createdAt != null &&
                          message!.createdAt
                              .subtract(const Duration(minutes: 5))
                              .isAfter(nextMessage!.createdAt)) {
                        showTime = true;
                      }

                      children = [
                        if (isNotification)
                          ChattingBubble(
                            message: message,
                            type: ChattingBubbleType.notification,
                          ),
                        if (showTime)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3, bottom: 8),
                              child: Text(
                                DateFormat('yyyy-MM-dd HH:mm')
                                    .format(message!.createdAt),
                              ),
                            ),
                          ),
                        if (showUsername)
                          ChattingBubble(
                            message: message,
                            type: ChattingBubbleType.username,
                          ),
                        if (!isNotification)
                          ChattingBubble(
                            isMe: isMe,
                            message: message,
                            showAvatar: showAvatar,
                          ),
                      ];

                      return Wrap(
                        children: children,
                      );
                    },
                  );
              }
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            );
          },
        ),
      );
    }, []);

    final buildInput = useCallback(() {
      return Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                fillColor: Colors.black.withOpacity(0.08),
                filled: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Material(
              color: Colors.yellow,
              child: InkWell(
                onTap: () {
                  if (controller.text.isNotEmpty) {
                    final text = controller.text;
                    controller.clear();
                    chattingRoomService.sendMessage(
                      text: text,
                    );
                  }
                },
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.send),
                ),
              ),
            ),
          ),
        ],
      );
    }, []);

    return BaseScaffold(
      title: name,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ],
      body: Column(
        children: [
          buildMessageList(),
          buildInput(),
        ],
      ),
    );
  }
}
