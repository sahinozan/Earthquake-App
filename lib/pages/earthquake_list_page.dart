import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EarthquakeListPage extends ConsumerWidget {
  const EarthquakeListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
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
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text('Earthquake'),
                  content: Text('Magnitude: 5.6'),
                ),
              );
            },
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
