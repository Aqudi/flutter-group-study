import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:newtalk/models/converters/timestamp_converter.dart';

part 'chatting_message.freezed.dart';
part 'chatting_message.g.dart';

enum ChattingMessageType {
  @JsonValue(0)
  text,
  @JsonValue(1)
  notification,
}

@freezed
class ChattingMessage with _$ChattingMessage {
  factory ChattingMessage({
    @JsonKey(ignore: true) String? id,
    required String text,
    required String? sendBy,
    required ChattingMessageType type,
    @TimestampConverter() required DateTime createdAt,
  }) = _ChattingMessage;

  factory ChattingMessage.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final a = ChattingMessage.fromJson(doc.data()!).copyWith(id: doc.id);
    return a;
  }

  factory ChattingMessage.fromJson(Map<String, dynamic> json) =>
      _$ChattingMessageFromJson(json);
}
