import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earthquake_app/earthquake.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

Future<Earthquake> fetchEarthquake() async {
  final response = await http.get(Uri.parse(
      'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&jsonerror=true&eventtype=earthquake&orderby=time&minmag=4&limit=10'));

  if (response.statusCode == 200) {
    return Earthquake.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load earthquake data');
  }
}

var earthquakeList = <Earthquake>[];

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
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Item 1'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.anchor),
                  title: Text('Item 2'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text('Item 3'),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              bool ascending = true;
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Wrap(
                    children: [
                      ListTile(
                        title: const Text('Sort by Magnitude'),
                        trailing: ascending == true
                            ? const Icon(Icons.arrow_upward)
                            : const Icon(
                                Icons.arrow_downward,
                              ),
                        onTap: () {
                          setState(() {
                            ascending = !ascending;
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('Sort by Date'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('Sort by Location'),
                        onTap: () {
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
        child: FutureBuilder<Earthquake>(
          future: futureEarthquake,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  earthquakeList.add(snapshot.data!);
                  Map<String, dynamic> firebaseData = {
                    'coordinates':
                        snapshot.data!.features[index].geometry.coordinates,
                    'id': snapshot.data!.features[index].id,
                    'mag': snapshot.data!.features[index].properties.mag,
                    'place': snapshot.data!.features[index].properties.place
                              .contains(' of ')
                          ? snapshot.data!.features[index].properties.place
                              .split(' of ')[1]
                          : snapshot.data!.features[index].properties.place,
                    'time': DateFormat.yMMMd().add_jms().format(
                          DateTime.fromMillisecondsSinceEpoch(
                            snapshot.data!.features[index].properties.time,
                          ),
                        ),
                  };
                  /*
                  FirebaseFirestore.instance
                      .collection('earthquakes')
                      .add(firebaseData);
                  */
                  FirebaseFirestore.instance.collection('earthquakes').doc(firebaseData['id']).set(firebaseData);
                  return ListTile(
                    title: Text(
                      snapshot.data!.features[index].properties.place
                              .contains(' of ')
                          ? snapshot.data!.features[index].properties.place
                              .split(' of ')[1]
                          : snapshot.data!.features[index].properties.place,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().add_jms().format(
                            DateTime.fromMillisecondsSinceEpoch(
                              snapshot.data!.features[index].properties.time,
                            ),
                          ),
                    ),
                    trailing: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: magnitudeColors(
                            snapshot.data!.features[index].properties.mag),
                      ),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            snapshot.data!.features[index].properties.mag
                                .toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.features.length,
                // itemCount: 100,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
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
