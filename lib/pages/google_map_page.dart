import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: center,
          zoom: 1.0,
        ),
      ),
    );
  }
  /*
  void createAllMarkers() {
    allMarkers.clear();
    for (int i = 0; i < 100; i++) {
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
  */

  void createAllMarkers1() {
    allMarkers.clear();
    FirebaseFirestore.instance.collection('earthquakes').get().then(
          (res) => res.docs.forEach(
            (doc) => allMarkers.add(
              Marker(
                markerId: MarkerId(doc.get('id')),
                position: LatLng(
                    doc.get('coordinates')[0], doc.get('coordinates')[1]),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueYellow,
                ),
              ),
            ),
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    createAllMarkers1();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 1.0,
      ),
      markers: Set.from(allMarkers),
    );
  }
}
