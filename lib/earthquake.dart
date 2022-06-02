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

  factory Earthquake.fromJson(Map<String, Object?> json) =>
      _$EarthquakeFromJson(json);
}

@freezed
class Feature with _$Feature {
  const factory Feature({
    required Properties properties,
    required String id,
    required Geometry geometry,
  }) = _Feature;

  factory Feature.fromJson(Map<String, Object?> json) =>
      _$FeatureFromJson(json);
}

@freezed
class Properties with _$Properties {
  const factory Properties({
    required double mag,
    required String place,
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

  factory Geometry.fromJson(Map<String, Object?> json) =>
      _$GeometryFromJson(json);
}

/*
class Earthquake {
  String type;
  List<Feature> features;

  Earthquake({
    required this.type,
    required this.features,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) => Earthquake(
        type: json["type"],
        features: List<Feature>.from(
          json["features"].map((x) => Feature.fromJson(x)),
        ),
      );
}

class Feature {
  Properties properties;
  Geometry geometry;
  String id;

  Feature({
    required this.properties,
    required this.id,
    required this.geometry,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        properties: Properties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
        id: json["id"],
      );
}

class Properties {
  double mag;
  String place;
  int time;

  Properties({
    required this.mag,
    required this.place,
    required this.time,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        mag: json["mag"].toDouble(),
        place: json["place"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "mag": mag,
        "place": place,
        "time": time,
      };

  String placeFormatter(Future<dynamic> earthquake) {
    if (place.contains('of ')) {
      List substring = place.split('of ');
      return substring[1];
    } else {
      return place;
    }
  }
}

class Geometry {
  List<double> coordinates;

  Geometry({
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );
}
*/