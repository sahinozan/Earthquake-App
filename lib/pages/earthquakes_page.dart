import 'package:earthquake_app/pages/earthquake.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:intl/intl.dart';

Future<Earthquake> fetchEarthquake() async {
  final response = await http.get(Uri.parse(
      'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&eventtype=earthquake&orderby=time&minmag=5&limit=100'));

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
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
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
                  return ListTile(
                    title: Text(
                      snapshot.data!.features[index].properties.place
                              .contains(' of ')
                          ? snapshot.data!.features[index].properties.place
                              .split(' of ')[1]
                          : snapshot.data!.features[index].properties.place,
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          DateFormat.yMMMd().format(
                              DateTime.fromMillisecondsSinceEpoch(snapshot
                                  .data!.features[index].properties.time)),
                        ),
                        Text(snapshot
                                .data!.features[index].geometry.coordinates[0]
                                .toString() +
                            ',' +
                            snapshot
                                .data!.features[index].geometry.coordinates[1]
                                .toString()),
                      ],
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
