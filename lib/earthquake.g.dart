// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earthquake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Earthquake _$$_EarthquakeFromJson(Map json) => _$_Earthquake(
      type: json['type'] as String,
      features: (json['features'] as List<dynamic>)
          .map((e) => Feature.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_EarthquakeToJson(_$_Earthquake instance) =>
    <String, dynamic>{
      'type': instance.type,
      'features': instance.features.map((e) => e.toJson()).toList(),
    };

_$_Feature _$$_FeatureFromJson(Map json) => _$_Feature(
      properties: Properties.fromJson(
          Map<String, Object?>.from(json['properties'] as Map)),
      id: json['id'] as String,
      geometry:
          Geometry.fromJson(Map<String, dynamic>.from(json['geometry'] as Map)),
    );

Map<String, dynamic> _$$_FeatureToJson(_$_Feature instance) =>
    <String, dynamic>{
      'properties': instance.properties.toJson(),
      'id': instance.id,
      'geometry': instance.geometry.toJson(),
    };

_$_Properties _$$_PropertiesFromJson(Map json) => _$_Properties(
      mag: (json['mag'] as num).toDouble(),
      place: json['place'] as String?,
      time: json['time'] as int,
    );

Map<String, dynamic> _$$_PropertiesToJson(_$_Properties instance) =>
    <String, dynamic>{
      'mag': instance.mag,
      'place': instance.place,
      'time': instance.time,
    };

_$_Geometry _$$_GeometryFromJson(Map json) => _$_Geometry(
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_GeometryToJson(_$_Geometry instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
    };
