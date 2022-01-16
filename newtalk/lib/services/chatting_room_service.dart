import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newtalk/models/chatting_message.dart';
import 'package:newtalk/models/chatting_room.dart';
import 'package:newtalk/services/auth_service.dart';
import 'package:newtalk/services/base_service.dart';

final chattingRoomServiceProvider = ChangeNotifierProvider((ref) {
  final authService = ref.watch(authServiceProvider);
  return ChattingRoomService(authService);
});

class ChattingRoomService extends BaseService {
  final AuthService _authService;
  ChattingRoom? _currentRoom;

  // firesotre 레퍼런스들
  final _roomsRef = FirebaseFirestore.instance
      .collection('rooms')
      .withConverter(
        fromFirestore: (snapshot, _) => ChattingRoom.fromFirestore(snapshot),
        toFirestore: (ChattingRoom room, _) => room.toJson(),
      );

  CollectionReference<ChattingMessage> get _roomMessagesRef =>
      _roomsRef.doc(_currentRoom?.id).collection("messages").withConverter(
            fromFirestore: (snapshot, _) =>
                ChattingMessage.fromFirestore(snapshot),
            toFirestore: (ChattingMessage message, _) => message.toJson(),
          );

  ChattingRoomService(this._authService);

  Stream<QuerySnapshot<ChattingRoom>> getRooms() {
    final snapshot = _roomsRef
        .where(
          "userIds",
          arrayContains: _authService.name,
        )
        .orderBy("updatedAt", descending: true)
        .snapshots();
    return snapshot;
  }

  /// TODO: direct 메시지 방이 있는지 확인하여 roomId를 반환
  Future<String?> checkDirectMessageRoom(String targetId) async {}

  /// 채팅 방 만들기
  Future<void> createRoom({
    required String roomName,
    required List<String> userIds,
  }) async {
    final now = DateTime.now();
    // 상대가 1명이면 direct 메시지 아니면 group 메시지
    final type =
        userIds.length == 1 ? ChattingRoomType.direct : ChattingRoomType.group;

    // 자신을 방에 참가시킴
    userIds.add(_authService.name!);

    // // direct 메시지 방이 있는지 확인
    // if (type == ChattingRoomType.direct) {
    //   final roomId = await checkDirectMessageRoom(userIds.first);
    //   // direct 메시지 방이 있다면 해당 방 id로현재 방을 설정;
    //   if (roomId != null) {
    //     setCurrentRoom(roomId);
    //     return;
    //   }
    // }

    // 방 생성 및 DB에 반영
    final room = ChattingRoom(
      name: roomName,
      updatedAt: now,
      createdAt: now,
      createdBy: _authService.name,
      type: type,
      userIds: userIds,
    );

    // 생성된 방 ID를 넣어서 현재 Room을 지정
    final roomDocument = await _roomsRef.add(room);
    setCurrentRoom(room.copyWith(id: roomDocument.id));
  }

  void setCurrentRoom(ChattingRoom room) {
    _currentRoom = room;
  }

  /// 현재 방의 메시지 가져오기
  Stream<QuerySnapshot<ChattingMessage>> getMessages() {
    return _roomMessagesRef.orderBy("createdAt", descending: true).snapshots();
  }

  /// 현재 방에 메시지 보내기
  Future<void> sendMessage({
    required String createdBy,
    required String text,
  }) async {
    final now = DateTime.now();
    final message = ChattingMessage(
      createdAt: now,
      sendBy: createdBy,
      text: text,
    );
    // 메시지 추가
    await _roomMessagesRef.add(message);
    // 마지막 메시지 업데이트
    await _roomsRef
        .doc(_currentRoom?.id)
        .update({"recentMessage": message.toJson()});
  }
}
