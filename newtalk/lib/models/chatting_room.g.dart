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
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
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
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'userIds': instance.userIds,
      'recentMessage': instance.recentMessage,
    };

const _$ChattingRoomTypeEnumMap = {
  ChattingRoomType.direct: 0,
  ChattingRoomType.group: 1,
};
