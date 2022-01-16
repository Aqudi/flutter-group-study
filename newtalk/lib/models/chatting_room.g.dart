// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatting_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChattingRoom _$$_ChattingRoomFromJson(Map<String, dynamic> json) =>
    _$_ChattingRoom(
      name: json['name'] as String?,
      createdBy: json['createdBy'] as String?,
      type: $enumDecodeNullable(_$ChattingRoomTypeEnumMap, json['type']) ??
          ChattingRoomType.direct,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userIds: (json['userIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recentMessage: json['recentMessage'] == null
          ? null
          : ChattingMessage.fromJson(
              json['recentMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChattingRoomToJson(_$_ChattingRoom instance) =>
    <String, dynamic>{
      'name': instance.name,
      'createdBy': instance.createdBy,
      'type': _$ChattingRoomTypeEnumMap[instance.type],
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userIds': instance.userIds,
      'recentMessage': instance.recentMessage,
    };

const _$ChattingRoomTypeEnumMap = {
  ChattingRoomType.direct: 0,
  ChattingRoomType.group: 1,
};
