import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'earthquakes_page.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late GoogleMapController mapController;
  LatLng center = const LatLng(37.7749, -122.4194);

  Set<Marker> allMarkers = {};

  void createAllMarkers() {
    allMarkers.clear();
    for (int i = 0; i < earthquakeList.length; i++) {
      allMarkers.addAll(
        earthquakeList.map(
          (earthquake) => Marker(
            markerId: MarkerId(earthquake.features[i].id),
            position: LatLng(earthquake.features[i].geometry.coordinates[0],
                earthquake.features[i].geometry.coordinates[1]),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueYellow,
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    createAllMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(37.7749, -122.4194),
        zoom: 9.0,
      ),
      markers: Set.from(allMarkers),
    );
  }
}
