// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatting_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChattingMessage _$$_ChattingMessageFromJson(Map<String, dynamic> json) =>
    _$_ChattingMessage(
      text: json['text'] as String,
      sendBy: json['sendBy'] as String?,
      type: $enumDecode(_$ChattingMessageTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_ChattingMessageToJson(_$_ChattingMessage instance) =>
    <String, dynamic>{
      'text': instance.text,
      'sendBy': instance.sendBy,
      'type': _$ChattingMessageTypeEnumMap[instance.type],
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$ChattingMessageTypeEnumMap = {
  ChattingMessageType.text: 0,
  ChattingMessageType.notification: 1,
};
