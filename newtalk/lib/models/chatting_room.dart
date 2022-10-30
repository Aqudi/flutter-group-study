import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newtalk/models/chatting_message.dart';
import 'package:newtalk/models/converters/timestamp_converter.dart';

part 'chatting_room.g.dart';
part 'chatting_room.freezed.dart';

// enum 타입을 index로 변환해주기 위해 JsonValue 사용
// 참고: https://pub.dev/packages/json_serializable
enum ChattingRoomType {
  @JsonValue(0)
  direct,
  @JsonValue(1)
  group,
}

@freezed
class ChattingRoom with _$ChattingRoom {
  const factory ChattingRoom({
    // ignore: invalid_annotation_target
    @JsonKey(ignore: true) String? id,
    String? name,
    String? createdBy,
    @Default(ChattingRoomType.direct) ChattingRoomType? type,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    @Default([]) List<String>? userIds,
    ChattingMessage? recentMessage,
  }) = _ChattingRoom;

  // firestore에서 가져온 데이터를 object로 변환 (id 포함)
  factory ChattingRoom.fromFirestore(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      ChattingRoom.fromJson(doc.data()!).copyWith(id: doc.id);

  factory ChattingRoom.fromJson(Map<String, dynamic> json) =>
      _$ChattingRoomFromJson(json);
}
