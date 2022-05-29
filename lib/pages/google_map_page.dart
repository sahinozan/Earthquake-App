import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


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
    allMarkers.add(const Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.7749, -122.4194),
      infoWindow: InfoWindow(
        title: 'San Francisco',
        snippet: 'Population: 77,000,000',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(37.7749, -122.4194),
        zoom: 9.0,
      ),
    );
  }
}
