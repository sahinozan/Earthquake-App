import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'earthquake.freezed.dart';
part 'earthquake.g.dart';

@freezed
class Earthquake with _$Earthquake {
  const factory Earthquake({
    required String type,
    required List<Feature> features,
  }) = _Earthquake;

  factory Earthquake.fromJson(Map<String, dynamic> json) =>
      _$EarthquakeFromJson(json);
}

@freezed
class Feature with _$Feature {
  const factory Feature({
    required Properties properties,
    required String id,
    required Geometry geometry,
  }) = _Feature;

  factory Feature.fromJson(Map<String, dynamic> json) =>
      _$FeatureFromJson(json);
}

@freezed
class Properties with _$Properties {
  const factory Properties({
    required double mag,
    required String? place,
    required int time,
  }) = _Properties;

  factory Properties.fromJson(Map<String, Object?> json) =>
      _$PropertiesFromJson(json);
}

@freezed
class Geometry with _$Geometry {
  const factory Geometry({
    required List<double> coordinates,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}
