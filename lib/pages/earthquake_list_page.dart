import 'package:flutter/material.dart';

class EarthquakeListPage extends StatelessWidget {
  const EarthquakeListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Earthquake List',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('Earthquake'),
            subtitle: Text('Earthquake description'),
            trailing: Icon(Icons.chevron_right),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
