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
  Set<Marker> _markers = {};
  double sliderValue = 0.0;

  var sliderValueMap = {
    0.0: 'Today',
    1.0: 'Last 7 days',
    2.0: 'Last 30 days',
  };

  Future _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers = allMarkers;
    });
    mapController = controller;

    if (ref.watch(selectedMarkerIdProvider) != const MarkerId('0')) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: ref.watch(selectedMarkerProvider),
            zoom: 3.0,
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
    // final currentDate = DateFormat.yMMMd().add_jms().format(DateTime.now());

    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(39.590176, -31.786420),
            zoom: 1.0,
          ),
          markers: _markers,
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
              if (value == 5) {
              } else {
                setState(() {});
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
