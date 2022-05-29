import 'package:earthquake_app/pages/earthquake.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<Earthquake> fetchEarthquake() async {
  final response = await http.get(Uri.parse(
      'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&eventtype=earthquake&orderby=time&minmag=5&limit=100'));

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
                  return ListTile(
                    title: Text(
                      snapshot.data!.features[index].properties.place
                              .contains(' of')
                          ? snapshot.data!.features[index].properties.place
                              .split(' of')[1]
                          : snapshot.data!.features[index].properties.place,
                    ),
                    subtitle: Text(
                      '${snapshot.data!.features[index].properties.time}',
                    ),
                    trailing: ColoredBox(
                      color: Colors.red,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text(
                            snapshot.data!.features[index].properties.mag
                                .toString(),
                            style: const TextStyle(fontSize: 18),
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
