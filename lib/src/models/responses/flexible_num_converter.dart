import 'package:json_annotation/json_annotation.dart';

class FlexibleNumConverter implements JsonConverter<num?, dynamic> {
  const FlexibleNumConverter();

  @override
  num? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is num) return json;
    if (json is String) return num.tryParse(json);
    return null;
  }

  @override
  dynamic toJson(num? object) => object;
}
