import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earthquake_app/earthquake.dart';
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
  // List<Object> _earthquakeList = [];

  Future _onMapCreated(GoogleMapController controller) async {
    createAllMarkers();
    mapController = controller;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: center,
          zoom: 1.0,
        ),
      ),
    );
    return const CircularProgressIndicator();
  }

  /*
  Future getEarthquakeList() async {
    var data = await FirebaseFirestore.instance
        .collection('earthquakes')
        .orderBy('time', descending: true)
        .get();

    setState(() { 
      _earthquakeList = List.from(
        data.docs.map(
          (doc) => Earthquake.fromSnapshot(doc),
        ),
      );
    });
  }
  */
  /*
  void createAllMarkers1() {
    allMarkers.clear();
    for (var i = 0; i < _earthquakeList.length; i++) {
      allMarkers.add(
        Marker(
          markerId: MarkerId(_earthquakeList[i].id),
          position: LatLng(
            _earthquakeList[i].latitude,
            _earthquakeList[i].longitude,
          ),
          infoWindow: InfoWindow(
            title: _earthquakeList[i].title,
            snippet: _earthquakeList[i].time,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueViolet,
          ),
        ),
      );
    }
  }
  */
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

  void createAllMarkers() async {
    setState(() {
      FirebaseFirestore.instance.collection('earthquakes').get().then(
            (res) => res.docs.forEach(
              (doc) => allMarkers.add(
                Marker(
                  markerId: MarkerId(doc.get('id')),
                  position: LatLng(
                      doc.get('coordinates')[0], doc.get('coordinates')[1]),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    doc.get('mag') > 5.5
                        ? BitmapDescriptor.hueRed
                        : doc.get('mag') > 4.5
                            ? BitmapDescriptor.hueOrange
                            : BitmapDescriptor.hueYellow,
                  ),
                ),
              ),
            ),
          );
    });
  }

  @override
  void initState() {
    createAllMarkers();
    super.initState();
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
