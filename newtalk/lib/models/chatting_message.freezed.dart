// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chatting_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChattingMessage _$ChattingMessageFromJson(Map<String, dynamic> json) {
  return _ChattingMessage.fromJson(json);
}

/// @nodoc
class _$ChattingMessageTearOff {
  const _$ChattingMessageTearOff();

  _ChattingMessage call(
      {@JsonKey(ignore: true) String? id,
      required String text,
      required String sendBy,
      required ChattingMessageType type,
      @TimestampConverter() required DateTime createdAt}) {
    return _ChattingMessage(
      id: id,
      text: text,
      sendBy: sendBy,
      type: type,
      createdAt: createdAt,
    );
  }

  ChattingMessage fromJson(Map<String, Object?> json) {
    return ChattingMessage.fromJson(json);
  }
}

/// @nodoc
const $ChattingMessage = _$ChattingMessageTearOff();

/// @nodoc
mixin _$ChattingMessage {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get sendBy => throw _privateConstructorUsedError;
  ChattingMessageType get type => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChattingMessageCopyWith<ChattingMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChattingMessageCopyWith<$Res> {
  factory $ChattingMessageCopyWith(
          ChattingMessage value, $Res Function(ChattingMessage) then) =
      _$ChattingMessageCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String text,
      String sendBy,
      ChattingMessageType type,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$ChattingMessageCopyWithImpl<$Res>
    implements $ChattingMessageCopyWith<$Res> {
  _$ChattingMessageCopyWithImpl(this._value, this._then);

  final ChattingMessage _value;
  // ignore: unused_field
  final $Res Function(ChattingMessage) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? sendBy = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      sendBy: sendBy == freezed
          ? _value.sendBy
          : sendBy // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChattingMessageType,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ChattingMessageCopyWith<$Res>
    implements $ChattingMessageCopyWith<$Res> {
  factory _$ChattingMessageCopyWith(
          _ChattingMessage value, $Res Function(_ChattingMessage) then) =
      __$ChattingMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String text,
      String sendBy,
      ChattingMessageType type,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$ChattingMessageCopyWithImpl<$Res>
    extends _$ChattingMessageCopyWithImpl<$Res>
    implements _$ChattingMessageCopyWith<$Res> {
  __$ChattingMessageCopyWithImpl(
      _ChattingMessage _value, $Res Function(_ChattingMessage) _then)
      : super(_value, (v) => _then(v as _ChattingMessage));

  @override
  _ChattingMessage get _value => super._value as _ChattingMessage;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? sendBy = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_ChattingMessage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      sendBy: sendBy == freezed
          ? _value.sendBy
          : sendBy // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChattingMessageType,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChattingMessage implements _ChattingMessage {
  _$_ChattingMessage(
      {@JsonKey(ignore: true) this.id,
      required this.text,
      required this.sendBy,
      required this.type,
      @TimestampConverter() required this.createdAt});

  factory _$_ChattingMessage.fromJson(Map<String, dynamic> json) =>
      _$$_ChattingMessageFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String text;
  @override
  final String sendBy;
  @override
  final ChattingMessageType type;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'ChattingMessage(id: $id, text: $text, sendBy: $sendBy, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChattingMessage &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.sendBy, sendBy) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(sendBy),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ChattingMessageCopyWith<_ChattingMessage> get copyWith =>
      __$ChattingMessageCopyWithImpl<_ChattingMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChattingMessageToJson(this);
  }
}

abstract class _ChattingMessage implements ChattingMessage {
  factory _ChattingMessage(
      {@JsonKey(ignore: true) String? id,
      required String text,
      required String sendBy,
      required ChattingMessageType type,
      @TimestampConverter() required DateTime createdAt}) = _$_ChattingMessage;

  factory _ChattingMessage.fromJson(Map<String, dynamic> json) =
      _$_ChattingMessage.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get text;
  @override
  String get sendBy;
  @override
  ChattingMessageType get type;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$ChattingMessageCopyWith<_ChattingMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
