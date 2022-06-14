import 'package:earthquake_app/pages/earthquakes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends ConsumerStatefulWidget {
  const GoogleMapPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<GoogleMapPage> createState() => _GoogleMapPageConsumerState();
}

class _GoogleMapPageConsumerState extends ConsumerState<GoogleMapPage> {
  late GoogleMapController mapController;
  LatLng center = const LatLng(39.590176, -31.786420);
  Set<Marker> _markers = {};

  Future _onMapCreated(
      GoogleMapController controller) async {
    setState(() {
      _markers = allMarkers;
    });
    mapController = controller;

    /*
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: LatLng(19.590176, -70.786420),
          zoom: 1.0,
        ),
      ),
    );
    */
    // return const CircularProgressIndicator();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return createGoogleMaps();
  }

  GoogleMap createGoogleMaps() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 1.0,
      ),
      markers: _markers,
    );
  }
}
