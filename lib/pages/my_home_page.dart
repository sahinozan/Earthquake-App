import 'package:earthquake_app/pages/earthquakes_page.dart';
import 'package:earthquake_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:earthquake_app/pages/google_map_page.dart';
import 'package:animations/animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationBarProvider = StateProvider((ref) => 0);

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
      const GoogleMapPage(),
      const EarthquakesPage(),
      const SettingsPage(),
    ];
    return Scaffold(
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
            icon: Icon(Icons.home),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
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
