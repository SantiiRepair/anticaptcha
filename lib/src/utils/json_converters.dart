import 'package:json_annotation/json_annotation.dart';

/// Converter to handle cases where the API returns a number as a String.
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

class FlexibleDoubleConverter implements JsonConverter<double?, dynamic> {
  const FlexibleDoubleConverter();
  @override
  double? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is num) return json.toDouble();
    if (json is String) return double.tryParse(json);
    return null;
  }
  @override
  dynamic toJson(double? object) => object;
}
