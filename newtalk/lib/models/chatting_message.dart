import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:newtalk/models/converters/timestamp_converter.dart';

part 'chatting_message.g.dart';

@JsonSerializable()
class ChattingMessage {
  @JsonKey(ignore: true)
  final String? id;
  final String text;
  final String sendBy;
  @TimestampConverter()
  final DateTime createdAt;

  ChattingMessage({
    this.id,
    required this.text,
    required this.sendBy,
    required this.createdAt,
  });

  factory ChattingMessage.fromFirestore(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      ChattingMessage.fromJson(doc.data()!).copyWith(id: doc.id);

  factory ChattingMessage.fromJson(Map<String, dynamic> json) =>
      _$ChattingMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChattingMessageToJson(this);

  ChattingMessage copyWith({
    String? id,
    String? text,
    String? sendBy,
    DateTime? createdAt,
  }) {
    return ChattingMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      sendBy: sendBy ?? this.sendBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
