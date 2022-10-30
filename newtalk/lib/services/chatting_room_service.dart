import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
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

  ChattingRoom get currentRoom => _currentRoom!;

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
          arrayContains: _authService.user.uid,
        )
        .orderBy("updatedAt", descending: true)
        .snapshots();
    return snapshot;
  }

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
    userIds.add(_authService.user.uid);
    userIds.sort();

    // 방 생성 및 DB에 반영
    final room = ChattingRoom(
      name: roomName,
      updatedAt: now,
      createdAt: now,
      createdBy: _authService.user.uid,
      type: type,
      userIds: userIds,
    );

    bool created = false;
    DocumentReference<ChattingRoom> roomDocument;
    if (type == ChattingRoomType.direct) {
      // Direct message 중복 생성을 방지하기 위해 두 user의 UID를 합쳐 HASH ID 생성
      final bytes = utf8.encode(userIds.join(','));
      final roomId = sha256.convert(bytes);
      roomDocument = _roomsRef.doc(roomId.toString());

      // 방이 없으면 생성
      final snapshot = await roomDocument.get();
      if (!snapshot.exists) {
        roomDocument.set(room);
        created = true;
      }
    } else {
      // 생성된 방 ID를 넣어서 현재 Room을 지정
      roomDocument = await _roomsRef.add(room);
      created = true;
    }

    setCurrentRoom(room.copyWith(id: roomDocument.id));
    if (created) {
      await sendMessage(
        text: "'${_authService.user.name}'님이 채팅방을 만드셨습니다.",
        type: ChattingMessageType.notification,
      );
    }
  }

  void setCurrentRoom(ChattingRoom room) {
    _currentRoom = room;
    notifyListeners();
  }

  /// 현재 방의 메시지 가져오기
  Stream<QuerySnapshot<ChattingMessage>> getMessages() {
    return _roomMessagesRef.orderBy("createdAt", descending: true).snapshots();
  }

  /// 현재 방에 메시지 보내기
  Future<void> sendMessage({
    required String text,
    ChattingMessageType type = ChattingMessageType.text,
  }) async {
    final now = DateTime.now();
    final message = ChattingMessage(
      createdAt: now,
      sendBy: _authService.user.uid,
      text: text,
      type: type,
    );
    // 메시지 추가
    await _roomMessagesRef.add(message);
    // 마지막 메시지 업데이트
    await _roomsRef.doc(_currentRoom?.id).update({
      "recentMessage": message.toJson(),
      "updatedAt": now,
    });
  }
}
