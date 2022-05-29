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
