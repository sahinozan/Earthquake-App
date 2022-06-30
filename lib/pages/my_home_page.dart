import 'package:earthquake_app/pages/earthquakes_page.dart';
import 'package:earthquake_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:earthquake_app/pages/google_map_page.dart';
import 'package:animations/animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final bottomNavigationBarProvider = StateProvider((ref) => 0);
final selectedMarkerProvider =
    StateProvider((ref) => const LatLng(39.590176, -31.786420));
final selectedMarkerIdProvider = StateProvider((ref) => const MarkerId('0'));

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screens = [
      const EarthquakesPage(),
      const GoogleMapPage(),
      const SettingsPage(),
    ];
    return Scaffold(
      // This animation part is mostly taken from a stackoverflow post (Line 35-45)
      // https://stackoverflow.com/questions/69881213/flutter-pagetransitionswitcher-is-not-working 
      // Just made a little modification on the code snippet to make it work with my app
      body: PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: screens[ref.watch(bottomNavigationBarProvider)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: ref.watch(bottomNavigationBarProvider),
        selectedItemColor: Colors.amber,
        onTap: (value) {
          ref.read(bottomNavigationBarProvider.notifier).state = value;
        },
      ),
    );
  }
}
