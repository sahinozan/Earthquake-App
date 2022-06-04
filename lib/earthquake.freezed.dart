// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'earthquake.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Earthquake _$EarthquakeFromJson(Map<String, dynamic> json) {
  return _Earthquake.fromJson(json);
}

/// @nodoc
mixin _$Earthquake {
  String get type => throw _privateConstructorUsedError;
  List<Feature> get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EarthquakeCopyWith<Earthquake> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarthquakeCopyWith<$Res> {
  factory $EarthquakeCopyWith(
          Earthquake value, $Res Function(Earthquake) then) =
      _$EarthquakeCopyWithImpl<$Res>;
  $Res call({String type, List<Feature> features});
}

/// @nodoc
class _$EarthquakeCopyWithImpl<$Res> implements $EarthquakeCopyWith<$Res> {
  _$EarthquakeCopyWithImpl(this._value, this._then);

  final Earthquake _value;
  // ignore: unused_field
  final $Res Function(Earthquake) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? features = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Feature>,
    ));
  }
}

/// @nodoc
abstract class _$$_EarthquakeCopyWith<$Res>
    implements $EarthquakeCopyWith<$Res> {
  factory _$$_EarthquakeCopyWith(
          _$_Earthquake value, $Res Function(_$_Earthquake) then) =
      __$$_EarthquakeCopyWithImpl<$Res>;
  @override
  $Res call({String type, List<Feature> features});
}

/// @nodoc
class __$$_EarthquakeCopyWithImpl<$Res> extends _$EarthquakeCopyWithImpl<$Res>
    implements _$$_EarthquakeCopyWith<$Res> {
  __$$_EarthquakeCopyWithImpl(
      _$_Earthquake _value, $Res Function(_$_Earthquake) _then)
      : super(_value, (v) => _then(v as _$_Earthquake));

  @override
  _$_Earthquake get _value => super._value as _$_Earthquake;

  @override
  $Res call({
    Object? type = freezed,
    Object? features = freezed,
  }) {
    return _then(_$_Earthquake(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      features: features == freezed
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Feature>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Earthquake with DiagnosticableTreeMixin implements _Earthquake {
  const _$_Earthquake(
      {required this.type, required final List<Feature> features})
      : _features = features;

  factory _$_Earthquake.fromJson(Map<String, dynamic> json) =>
      _$$_EarthquakeFromJson(json);

  @override
  final String type;
  final List<Feature> _features;
  @override
  List<Feature> get features {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Earthquake(type: $type, features: $features)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Earthquake'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('features', features));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Earthquake &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  _$$_EarthquakeCopyWith<_$_Earthquake> get copyWith =>
      __$$_EarthquakeCopyWithImpl<_$_Earthquake>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EarthquakeToJson(this);
  }
}

abstract class _Earthquake implements Earthquake {
  const factory _Earthquake(
      {required final String type,
      required final List<Feature> features}) = _$_Earthquake;

  factory _Earthquake.fromJson(Map<String, dynamic> json) =
      _$_Earthquake.fromJson;

  @override
  String get type => throw _privateConstructorUsedError;
  @override
  List<Feature> get features => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EarthquakeCopyWith<_$_Earthquake> get copyWith =>
      throw _privateConstructorUsedError;
}

Feature _$FeatureFromJson(Map<String, dynamic> json) {
  return _Feature.fromJson(json);
}

/// @nodoc
mixin _$Feature {
  Properties get properties => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Geometry get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureCopyWith<Feature> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureCopyWith<$Res> {
  factory $FeatureCopyWith(Feature value, $Res Function(Feature) then) =
      _$FeatureCopyWithImpl<$Res>;
  $Res call({Properties properties, String id, Geometry geometry});

  $PropertiesCopyWith<$Res> get properties;
  $GeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class _$FeatureCopyWithImpl<$Res> implements $FeatureCopyWith<$Res> {
  _$FeatureCopyWithImpl(this._value, this._then);

  final Feature _value;
  // ignore: unused_field
  final $Res Function(Feature) _then;

  @override
  $Res call({
    Object? properties = freezed,
    Object? id = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_value.copyWith(
      properties: properties == freezed
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Properties,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry,
    ));
  }

  @override
  $PropertiesCopyWith<$Res> get properties {
    return $PropertiesCopyWith<$Res>(_value.properties, (value) {
      return _then(_value.copyWith(properties: value));
    });
  }

  @override
  $GeometryCopyWith<$Res> get geometry {
    return $GeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value));
    });
  }
}

/// @nodoc
abstract class _$$_FeatureCopyWith<$Res> implements $FeatureCopyWith<$Res> {
  factory _$$_FeatureCopyWith(
          _$_Feature value, $Res Function(_$_Feature) then) =
      __$$_FeatureCopyWithImpl<$Res>;
  @override
  $Res call({Properties properties, String id, Geometry geometry});

  @override
  $PropertiesCopyWith<$Res> get properties;
  @override
  $GeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class __$$_FeatureCopyWithImpl<$Res> extends _$FeatureCopyWithImpl<$Res>
    implements _$$_FeatureCopyWith<$Res> {
  __$$_FeatureCopyWithImpl(_$_Feature _value, $Res Function(_$_Feature) _then)
      : super(_value, (v) => _then(v as _$_Feature));

  @override
  _$_Feature get _value => super._value as _$_Feature;

  @override
  $Res call({
    Object? properties = freezed,
    Object? id = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_$_Feature(
      properties: properties == freezed
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Properties,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Feature with DiagnosticableTreeMixin implements _Feature {
  const _$_Feature(
      {required this.properties, required this.id, required this.geometry});

  factory _$_Feature.fromJson(Map<String, dynamic> json) =>
      _$$_FeatureFromJson(json);

  @override
  final Properties properties;
  @override
  final String id;
  @override
  final Geometry geometry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Feature(properties: $properties, id: $id, geometry: $geometry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Feature'))
      ..add(DiagnosticsProperty('properties', properties))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('geometry', geometry));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Feature &&
            const DeepCollectionEquality()
                .equals(other.properties, properties) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.geometry, geometry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(properties),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(geometry));

  @JsonKey(ignore: true)
  @override
  _$$_FeatureCopyWith<_$_Feature> get copyWith =>
      __$$_FeatureCopyWithImpl<_$_Feature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeatureToJson(this);
  }
}

abstract class _Feature implements Feature {
  const factory _Feature(
      {required final Properties properties,
      required final String id,
      required final Geometry geometry}) = _$_Feature;

  factory _Feature.fromJson(Map<String, dynamic> json) = _$_Feature.fromJson;

  @override
  Properties get properties => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  Geometry get geometry => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FeatureCopyWith<_$_Feature> get copyWith =>
      throw _privateConstructorUsedError;
}

Properties _$PropertiesFromJson(Map<String, dynamic> json) {
  return _Properties.fromJson(json);
}

/// @nodoc
mixin _$Properties {
  double get mag => throw _privateConstructorUsedError;
  String? get place => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PropertiesCopyWith<Properties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertiesCopyWith<$Res> {
  factory $PropertiesCopyWith(
          Properties value, $Res Function(Properties) then) =
      _$PropertiesCopyWithImpl<$Res>;
  $Res call({double mag, String? place, int time});
}

/// @nodoc
class _$PropertiesCopyWithImpl<$Res> implements $PropertiesCopyWith<$Res> {
  _$PropertiesCopyWithImpl(this._value, this._then);

  final Properties _value;
  // ignore: unused_field
  final $Res Function(Properties) _then;

  @override
  $Res call({
    Object? mag = freezed,
    Object? place = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      mag: mag == freezed
          ? _value.mag
          : mag // ignore: cast_nullable_to_non_nullable
              as double,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PropertiesCopyWith<$Res>
    implements $PropertiesCopyWith<$Res> {
  factory _$$_PropertiesCopyWith(
          _$_Properties value, $Res Function(_$_Properties) then) =
      __$$_PropertiesCopyWithImpl<$Res>;
  @override
  $Res call({double mag, String? place, int time});
}

/// @nodoc
class __$$_PropertiesCopyWithImpl<$Res> extends _$PropertiesCopyWithImpl<$Res>
    implements _$$_PropertiesCopyWith<$Res> {
  __$$_PropertiesCopyWithImpl(
      _$_Properties _value, $Res Function(_$_Properties) _then)
      : super(_value, (v) => _then(v as _$_Properties));

  @override
  _$_Properties get _value => super._value as _$_Properties;

  @override
  $Res call({
    Object? mag = freezed,
    Object? place = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_Properties(
      mag: mag == freezed
          ? _value.mag
          : mag // ignore: cast_nullable_to_non_nullable
              as double,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Properties with DiagnosticableTreeMixin implements _Properties {
  const _$_Properties(
      {required this.mag, required this.place, required this.time});

  factory _$_Properties.fromJson(Map<String, dynamic> json) =>
      _$$_PropertiesFromJson(json);

  @override
  final double mag;
  @override
  final String? place;
  @override
  final int time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Properties(mag: $mag, place: $place, time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Properties'))
      ..add(DiagnosticsProperty('mag', mag))
      ..add(DiagnosticsProperty('place', place))
      ..add(DiagnosticsProperty('time', time));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Properties &&
            const DeepCollectionEquality().equals(other.mag, mag) &&
            const DeepCollectionEquality().equals(other.place, place) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mag),
      const DeepCollectionEquality().hash(place),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$$_PropertiesCopyWith<_$_Properties> get copyWith =>
      __$$_PropertiesCopyWithImpl<_$_Properties>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PropertiesToJson(this);
  }
}

abstract class _Properties implements Properties {
  const factory _Properties(
      {required final double mag,
      required final String? place,
      required final int time}) = _$_Properties;

  factory _Properties.fromJson(Map<String, dynamic> json) =
      _$_Properties.fromJson;

  @override
  double get mag => throw _privateConstructorUsedError;
  @override
  String? get place => throw _privateConstructorUsedError;
  @override
  int get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PropertiesCopyWith<_$_Properties> get copyWith =>
      throw _privateConstructorUsedError;
}

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return _Geometry.fromJson(json);
}

/// @nodoc
mixin _$Geometry {
  List<double> get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeometryCopyWith<Geometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeometryCopyWith<$Res> {
  factory $GeometryCopyWith(Geometry value, $Res Function(Geometry) then) =
      _$GeometryCopyWithImpl<$Res>;
  $Res call({List<double> coordinates});
}

/// @nodoc
class _$GeometryCopyWithImpl<$Res> implements $GeometryCopyWith<$Res> {
  _$GeometryCopyWithImpl(this._value, this._then);

  final Geometry _value;
  // ignore: unused_field
  final $Res Function(Geometry) _then;

  @override
  $Res call({
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
abstract class _$$_GeometryCopyWith<$Res> implements $GeometryCopyWith<$Res> {
  factory _$$_GeometryCopyWith(
          _$_Geometry value, $Res Function(_$_Geometry) then) =
      __$$_GeometryCopyWithImpl<$Res>;
  @override
  $Res call({List<double> coordinates});
}

/// @nodoc
class __$$_GeometryCopyWithImpl<$Res> extends _$GeometryCopyWithImpl<$Res>
    implements _$$_GeometryCopyWith<$Res> {
  __$$_GeometryCopyWithImpl(
      _$_Geometry _value, $Res Function(_$_Geometry) _then)
      : super(_value, (v) => _then(v as _$_Geometry));

  @override
  _$_Geometry get _value => super._value as _$_Geometry;

  @override
  $Res call({
    Object? coordinates = freezed,
  }) {
    return _then(_$_Geometry(
      coordinates: coordinates == freezed
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Geometry with DiagnosticableTreeMixin implements _Geometry {
  const _$_Geometry({required final List<double> coordinates})
      : _coordinates = coordinates;

  factory _$_Geometry.fromJson(Map<String, dynamic> json) =>
      _$$_GeometryFromJson(json);

  final List<double> _coordinates;
  @override
  List<double> get coordinates {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Geometry(coordinates: $coordinates)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Geometry'))
      ..add(DiagnosticsProperty('coordinates', coordinates));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Geometry &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  _$$_GeometryCopyWith<_$_Geometry> get copyWith =>
      __$$_GeometryCopyWithImpl<_$_Geometry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeometryToJson(this);
  }
}

abstract class _Geometry implements Geometry {
  const factory _Geometry({required final List<double> coordinates}) =
      _$_Geometry;

  factory _Geometry.fromJson(Map<String, dynamic> json) = _$_Geometry.fromJson;

  @override
  List<double> get coordinates => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GeometryCopyWith<_$_Geometry> get copyWith =>
      throw _privateConstructorUsedError;
}
