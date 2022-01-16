import 'package:json_annotation/json_annotation.dart';

/// toJson할 때: DtaeTime을 int로 바꾸기
/// fromJson 할 때: int에서 DateTime으로 바꿔주는 역할
class TimestampConverter implements JsonConverter<DateTime, int> {
  const TimestampConverter();

  @override
  DateTime fromJson(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  @override
  int toJson(DateTime date) => date.millisecondsSinceEpoch;
}
