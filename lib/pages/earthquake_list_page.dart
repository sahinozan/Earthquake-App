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
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: const Text(
          'Earthquake List',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.grey.shade200,
            title: const Text('Earthquake'),
            subtitle: const Text('Earthquake description'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
            leading: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: const SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: Text(
                    '5.6',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 5,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
