import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earthquake_app/earthquake.dart';
import 'package:earthquake_app/pages/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

Set<Marker> allMarkers = {};
Map<String, Marker> allMarkersMap = {};
String filter = 'Date';
bool magAscending = false;
bool timeAscending = false;

Map<bool, Icon> magIcons = {
  true: const Icon(Icons.arrow_drop_down, size: 40),
  false: const Icon(Icons.arrow_drop_up, size: 40),
};

Map<bool, Icon> dateIcons = {
  true: const Icon(Icons.arrow_drop_down, size: 40),
  false: const Icon(Icons.arrow_drop_up, size: 40),
};

final magIconProvider = StateProvider<bool>((ref) => true);
final dateIconProvider = StateProvider<bool>((ref) => true);
var earthquakeList = <Earthquake>[];

Future<Earthquake> fetchEarthquake() async {
  var url =
      'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&jsonerror=true&eventtype=earthquake&orderby=time&minmag=4&limit=500';

  if (filter == 'Date') {
    if (timeAscending) {
      url =
          'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&jsonerror=true&eventtype=earthquake&orderby=time-asc&minmag=4&limit=500';
    } else {
      url =
          'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&jsonerror=true&eventtype=earthquake&orderby=time&minmag=4&limit=500';
    }
  }
  if (filter == 'Magnitude') {
    if (!magAscending) {
      url =
          'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&jsonerror=true&eventtype=earthquake&orderby=magnitude&minmag=4&limit=500';
    } else {
      url =
          'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&jsonerror=true&eventtype=earthquake&orderby=magnitude-asc&minmag=4&limit=500';
    }
  }

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Earthquake.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load earthquake data');
  }
}

class EarthquakesPage extends ConsumerStatefulWidget {
  const EarthquakesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EarthquakesPageState();
}

class _EarthquakesPageState extends ConsumerState<EarthquakesPage> {
  late Future<Earthquake> futureEarthquake;

  @override
  void initState() {
    super.initState();
    futureEarthquake = fetchEarthquake();
  }

  Color magnitudeColors(double mag) {
    if (mag < 5) {
      return Colors.green;
    } else if (mag < 5.5) {
      return Colors.yellow;
    } else if (mag < 6) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = StateProvider(
      (ref) => Theme.of(context).brightness == Brightness.dark,
    );
    final isDarkMode = ref.watch(darkModeProvider);
    futureEarthquake = fetchEarthquake();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Earthquake List',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Wrap(
                    children: [
                      ListTile(
                        title: const Text('Sort by Magnitude'),
                        trailing: magIcons[ref.watch(magIconProvider)],
                        onTap: () {
                          setState(() {
                            filter = 'Magnitude';
                            magAscending = !magAscending;
                            ref.watch(magIconProvider.notifier).state =
                                !ref.watch(magIconProvider.notifier).state;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('Sort by Date'),
                        trailing: dateIcons[ref.watch(dateIconProvider)],
                        onTap: () {
                          setState(() {
                            filter = 'Date';
                            timeAscending = !timeAscending;
                            ref.watch(dateIconProvider.notifier).state =
                                !ref.watch(dateIconProvider.notifier).state;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder<Earthquake>(
          stream: futureEarthquake.asStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: () async {
                  await futureEarthquake;
                  setState(() {});
                },
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    var shortPlace = 'Unknown';
                    if (snapshot.data!.features[index].properties.place !=
                            null &&
                        !snapshot.data!.features[index].properties.place!
                            .contains('?')) {
                      shortPlace = snapshot
                          .data!.features[index].properties.place
                          .toString();

                      if (shortPlace.contains(' of ')) {
                        shortPlace = shortPlace.split(' of ')[1];
                      }
                      shortPlace =
                          shortPlace[0].toUpperCase() + shortPlace.substring(1);

                      Map<String, dynamic> firebaseData = {
                        'coordinates': [
                          snapshot
                              .data?.features[index].geometry.coordinates[0],
                          snapshot
                              .data?.features[index].geometry.coordinates[1],
                        ],
                        'id': snapshot.data?.features[index].id,
                        'mag': snapshot.data?.features[index].properties.mag,
                        'place': shortPlace,
                        'time': DateFormat("yyyy-MM-dd hh:mm:ss").format(
                          DateTime.fromMillisecondsSinceEpoch(
                            snapshot.data!.features[index].properties.time,
                          ),
                        ),
                        'depth': snapshot
                            .data!.features[index].geometry.coordinates[2],
                      };
                      FirebaseFirestore.instance
                          .collection('earthquakes')
                          .doc(firebaseData['id'])
                          .set(firebaseData);

                      allMarkers.clear();
                      allMarkersMap.clear();

                      FirebaseFirestore.instance
                          .collection('earthquakes')
                          .get()
                          .then(
                            (res) => res.docs.forEach(
                              (doc) {
                                allMarkersMap[doc['time']] = Marker(
                                  markerId: MarkerId(doc.get('id')),
                                  position: LatLng(doc.get('coordinates')[1],
                                      doc.get('coordinates')[0]),
                                  icon: BitmapDescriptor.defaultMarkerWithHue(
                                    doc.get('mag') > 6
                                        ? BitmapDescriptor.hueRed
                                        : doc.get('mag') > 5
                                            ? BitmapDescriptor.hueOrange
                                            : doc.get('mag') > 4
                                                ? BitmapDescriptor.hueYellow
                                                : BitmapDescriptor.hueGreen,
                                  ),
                                  infoWindow: InfoWindow(
                                    title: doc.get('place'),
                                    snippet:
                                        '${doc.get('mag').toString()}  -  ${DateFormat.yMMMd().add_jms().format(DateFormat("yyyy-MM-dd hh:mm:ss").parse(doc.get('time')))}',
                                  ),
                                );
                              },
                            ),
                          );

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: ListTile(
                          title: Text(firebaseData['place']),
                          subtitle: Text(DateFormat.yMMMd()
                              .add_jms()
                              .format(
                                DateFormat("yyyy-MM-dd hh:mm:ss")
                                    .parse(firebaseData['time']),
                              )
                              .toString()),
                          trailing: SizedBox(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: magnitudeColors(firebaseData['mag']),
                              ),
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    firebaseData['mag'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            ref.read(selectedMarkerProvider.notifier).state =
                                LatLng(
                              snapshot.data!.features[index].geometry
                                  .coordinates[1],
                              snapshot.data!.features[index].geometry
                                  .coordinates[0],
                            );
                            ref
                                .watch(
                                  bottomNavigationBarProvider.notifier,
                                )
                                .state = 1;
                            ref.read(selectedMarkerIdProvider.notifier).state =
                                MarkerId(snapshot.data!.features[index].id);
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                  itemCount: snapshot.data!.features.length,
                  // itemCount: 100,
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
