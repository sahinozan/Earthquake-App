import 'package:earthquake_app/pages/earthquakes_page.dart';
import 'package:earthquake_app/pages/my_home_page.dart';
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
  Map<DateTime, Marker> _markersMap = {};
  Map<DateTime, Marker?> _shownMarkersMap = {};
  Map<DateTime, Circle> _circlesMap = {};
  Map<DateTime, Circle?> _shownCirclesMap = {};
  double sliderValue = 0.0;

  var sliderValueMap = {
    0.0: 'Last 15 days',
    1.0: 'Last 7 days',
    2.0: 'Today',
  };

  Future _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markersMap = allMarkersMap;
      _shownMarkersMap = allMarkersMap;
      _circlesMap = allCirclesMap;
      _shownCirclesMap = allCirclesMap;
    });
    mapController = controller;

    if (ref.watch(selectedMarkerIdProvider) != const MarkerId('0')) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: ref.watch(selectedMarkerProvider),
            zoom: 5.0,
          ),
        ),
      );
    }

    return const CircularProgressIndicator();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(39.590176, -31.786420),
            zoom: 1.0,
          ),
          markers: Set<Marker>.from(_shownMarkersMap.values),
          circles: Set<Circle>.from(_shownCirclesMap.values),
        ),
        Positioned(
          bottom: 40,
          left: 10,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(3),
              ),
            ),
            child: SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.info),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text('Earthquakes'),
                          content: Text(
                            'Earthquakes are the most common type of seismic activity. They are caused by the movement of the earth\'s crust and are usually felt by the people of the earth\'s surface. Earthquakes are also known as seismic waves.\n\nEarthquakes are caused by the movement of the earth\'s crust and are usually felt by the people of the earth\'s surface. Earthquakes are also known as seismic waves.',
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: MediaQuery.of(context).size.width * 0.2,
          right: MediaQuery.of(context).size.width * 0.2,
          child: Slider(
            inactiveColor: Colors.grey,
            activeColor: Colors.amber,
            max: 2,
            divisions: 2,
            label: sliderValueMap[sliderValue],
            value: sliderValue,
            onChanged: (double value) {
              Map<DateTime, Marker?> tempMarkersMap = {};
              Map<DateTime, Circle?> tempCirclesMap = {};

              if (value == 0) {
                for (final m in _markersMap.keys) {
                  if (DateTime.now().difference(m) <= const Duration(days: 1)) {
                    tempMarkersMap[m] = _markersMap[m];
                  }
                }
                for (final m in _circlesMap.keys) {
                  if (DateTime.now().difference(m) <= const Duration(days: 1)) {
                    tempCirclesMap[m] = _circlesMap[m];
                  }
                }
                setState(() {
                  _shownMarkersMap = _markersMap;
                  _shownCirclesMap = tempCirclesMap;
                });
              } else if (value == 1) {
                for (final m in _markersMap.keys) {
                  if (DateTime.now().difference(m) <=
                      const Duration(days: 15)) {
                    tempMarkersMap[m] = _markersMap[m];
                  }
                }
                for (final m in _circlesMap.keys) {
                  if (DateTime.now().difference(m) <=
                      const Duration(days: 15)) {
                    tempCirclesMap[m] = _circlesMap[m];
                  }
                }
                setState(() {
                  _shownMarkersMap = tempMarkersMap;
                  _shownCirclesMap = tempCirclesMap;
                });
              } else if (value == 2) {
                for (final m in _markersMap.keys) {
                  if (DateTime.now().difference(m) <= const Duration(days: 7)) {
                    tempMarkersMap[m] = _markersMap[m];
                  }
                }
                for (final m in _circlesMap.keys) {
                  if (DateTime.now().difference(m) <= const Duration(days: 7)) {
                    tempCirclesMap[m] = _circlesMap[m];
                  }
                }
                setState(() {
                  _shownMarkersMap = tempMarkersMap;
                  _shownCirclesMap = tempCirclesMap;
                });
              }
              setState(() {
                sliderValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
