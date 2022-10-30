// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chatting_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChattingRoom _$ChattingRoomFromJson(Map<String, dynamic> json) {
  return _ChattingRoom.fromJson(json);
}

/// @nodoc
class _$ChattingRoomTearOff {
  const _$ChattingRoomTearOff();

  _ChattingRoom call(
      {@JsonKey(ignore: true) String? id,
      String? name,
      String? createdBy,
      ChattingRoomType? type = ChattingRoomType.direct,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      List<String>? userIds = const [],
      ChattingMessage? recentMessage}) {
    return _ChattingRoom(
      id: id,
      name: name,
      createdBy: createdBy,
      type: type,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userIds: userIds,
      recentMessage: recentMessage,
    );
  }

  ChattingRoom fromJson(Map<String, Object?> json) {
    return ChattingRoom.fromJson(json);
  }
}

/// @nodoc
const $ChattingRoom = _$ChattingRoomTearOff();

/// @nodoc
mixin _$ChattingRoom {
// ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  ChattingRoomType? get type => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<String>? get userIds => throw _privateConstructorUsedError;
  ChattingMessage? get recentMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChattingRoomCopyWith<ChattingRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChattingRoomCopyWith<$Res> {
  factory $ChattingRoomCopyWith(
          ChattingRoom value, $Res Function(ChattingRoom) then) =
      _$ChattingRoomCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String? name,
      String? createdBy,
      ChattingRoomType? type,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      List<String>? userIds,
      ChattingMessage? recentMessage});

  $ChattingMessageCopyWith<$Res>? get recentMessage;
}

/// @nodoc
class _$ChattingRoomCopyWithImpl<$Res> implements $ChattingRoomCopyWith<$Res> {
  _$ChattingRoomCopyWithImpl(this._value, this._then);

  final ChattingRoom _value;
  // ignore: unused_field
  final $Res Function(ChattingRoom) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdBy = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userIds = freezed,
    Object? recentMessage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChattingRoomType?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userIds: userIds == freezed
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      recentMessage: recentMessage == freezed
          ? _value.recentMessage
          : recentMessage // ignore: cast_nullable_to_non_nullable
              as ChattingMessage?,
    ));
  }

  @override
  $ChattingMessageCopyWith<$Res>? get recentMessage {
    if (_value.recentMessage == null) {
      return null;
    }

    return $ChattingMessageCopyWith<$Res>(_value.recentMessage!, (value) {
      return _then(_value.copyWith(recentMessage: value));
    });
  }
}

/// @nodoc
abstract class _$ChattingRoomCopyWith<$Res>
    implements $ChattingRoomCopyWith<$Res> {
  factory _$ChattingRoomCopyWith(
          _ChattingRoom value, $Res Function(_ChattingRoom) then) =
      __$ChattingRoomCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String? name,
      String? createdBy,
      ChattingRoomType? type,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      List<String>? userIds,
      ChattingMessage? recentMessage});

  @override
  $ChattingMessageCopyWith<$Res>? get recentMessage;
}

/// @nodoc
class __$ChattingRoomCopyWithImpl<$Res> extends _$ChattingRoomCopyWithImpl<$Res>
    implements _$ChattingRoomCopyWith<$Res> {
  __$ChattingRoomCopyWithImpl(
      _ChattingRoom _value, $Res Function(_ChattingRoom) _then)
      : super(_value, (v) => _then(v as _ChattingRoom));

  @override
  _ChattingRoom get _value => super._value as _ChattingRoom;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdBy = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userIds = freezed,
    Object? recentMessage = freezed,
  }) {
    return _then(_ChattingRoom(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChattingRoomType?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userIds: userIds == freezed
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      recentMessage: recentMessage == freezed
          ? _value.recentMessage
          : recentMessage // ignore: cast_nullable_to_non_nullable
              as ChattingMessage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChattingRoom implements _ChattingRoom {
  const _$_ChattingRoom(
      {@JsonKey(ignore: true) this.id,
      this.name,
      this.createdBy,
      this.type = ChattingRoomType.direct,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.userIds = const [],
      this.recentMessage});

  factory _$_ChattingRoom.fromJson(Map<String, dynamic> json) =>
      _$$_ChattingRoomFromJson(json);

  @override // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String? name;
  @override
  final String? createdBy;
  @JsonKey()
  @override
  final ChattingRoomType? type;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;
  @JsonKey()
  @override
  final List<String>? userIds;
  @override
  final ChattingMessage? recentMessage;

  @override
  String toString() {
    return 'ChattingRoom(id: $id, name: $name, createdBy: $createdBy, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, userIds: $userIds, recentMessage: $recentMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChattingRoom &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.userIds, userIds) &&
            const DeepCollectionEquality()
                .equals(other.recentMessage, recentMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(userIds),
      const DeepCollectionEquality().hash(recentMessage));

  @JsonKey(ignore: true)
  @override
  _$ChattingRoomCopyWith<_ChattingRoom> get copyWith =>
      __$ChattingRoomCopyWithImpl<_ChattingRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChattingRoomToJson(this);
  }
}

abstract class _ChattingRoom implements ChattingRoom {
  const factory _ChattingRoom(
      {@JsonKey(ignore: true) String? id,
      String? name,
      String? createdBy,
      ChattingRoomType? type,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      List<String>? userIds,
      ChattingMessage? recentMessage}) = _$_ChattingRoom;

  factory _ChattingRoom.fromJson(Map<String, dynamic> json) =
      _$_ChattingRoom.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  String? get id;
  @override
  String? get name;
  @override
  String? get createdBy;
  @override
  ChattingRoomType? get type;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  List<String>? get userIds;
  @override
  ChattingMessage? get recentMessage;
  @override
  @JsonKey(ignore: true)
  _$ChattingRoomCopyWith<_ChattingRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
