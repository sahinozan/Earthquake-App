import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/my_home_page.dart';
import 'package:settings_ui/settings_ui.dart';

final darkModeProvider = StateProvider((ref) => false);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(darkModeProvider.notifier).state
          ? ThemeMode.light
          : ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      title: 'Earthquake App',
      home: const MyHomePage(),
    );
  }
}
