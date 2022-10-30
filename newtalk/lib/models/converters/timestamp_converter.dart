import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

/// toJson할 때: DtaeTime을 int로 바꾸기
/// fromJson 할 때: int에서 DateTime으로 바꿔주는 역할
class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? timestamp) {
    if (timestamp is int) {
      return DateTime.fromMillisecondsSinceEpoch(timestamp);
    }

    if (timestamp is Timestamp) {
      return timestamp.toDate();
    }

    return null;
  }

  @override
  int? toJson(DateTime? date) => date?.millisecondsSinceEpoch;
}
