// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatting_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChattingMessage _$ChattingMessageFromJson(Map<String, dynamic> json) =>
    ChattingMessage(
      text: json['text'] as String,
      sendBy: json['sendBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ChattingMessageToJson(ChattingMessage instance) =>
    <String, dynamic>{
      'text': instance.text,
      'sendBy': instance.sendBy,
      'createdAt': instance.createdAt.toIso8601String(),
    };
