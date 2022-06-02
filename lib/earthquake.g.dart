// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earthquake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Earthquake _$$_EarthquakeFromJson(Map<String, dynamic> json) =>
    _$_Earthquake(
      type: json['type'] as String,
      features: (json['features'] as List<dynamic>)
          .map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EarthquakeToJson(_$_Earthquake instance) =>
    <String, dynamic>{
      'type': instance.type,
      'features': instance.features,
    };

_$_Feature _$$_FeatureFromJson(Map<String, dynamic> json) => _$_Feature(
      properties:
          Properties.fromJson(json['properties'] as Map<String, dynamic>),
      id: json['id'] as String,
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FeatureToJson(_$_Feature instance) =>
    <String, dynamic>{
      'properties': instance.properties,
      'id': instance.id,
      'geometry': instance.geometry,
    };

_$_Properties _$$_PropertiesFromJson(Map<String, dynamic> json) =>
    _$_Properties(
      mag: (json['mag'] as num).toDouble(),
      place: json['place'] as String,
      time: json['time'] as int,
    );

Map<String, dynamic> _$$_PropertiesToJson(_$_Properties instance) =>
    <String, dynamic>{
      'mag': instance.mag,
      'place': instance.place,
      'time': instance.time,
    };

_$_Geometry _$$_GeometryFromJson(Map<String, dynamic> json) => _$_Geometry(
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_GeometryToJson(_$_Geometry instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
    };
