import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/models/chatting_room.dart';
import 'package:newtalk/pages/chatting/chatting_room_page.dart';
import 'package:newtalk/pages/chatting/widgets/chatting_list_tile.dart';
import 'package:newtalk/services/chatting_room_service.dart';

class ChattingListPage extends HookConsumerWidget {
  const ChattingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chattingRoomService = ref.read(chattingRoomServiceProvider);

    return StreamBuilder(
      stream: chattingRoomService.getRooms(),
      builder: (context, AsyncSnapshot<QuerySnapshot<ChattingRoom>> snapshot) {
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
                Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ];
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.size ?? 0,
                itemBuilder: (context, index) {
                  final room = snapshot.data?.docs.elementAt(index).data();
                  return ChattingListTile(
                    name: room?.userIds?.join(',') ?? '',
                    recentMessage: room?.recentMessage,
                    onTap: () {
                      chattingRoomService.setCurrentRoom(room!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChattingRoomPage(name: room.name),
                        ),
                      );
                    },
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
    );
  }
}
