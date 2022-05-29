import 'package:earthquake_app/main.dart';
import 'package:earthquake_app/pages/language_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

final languageProvider = StateProvider((ref) => 'English');
final indexProvider = StateProvider((ref) => 0);
final languageSettingsButtonProvider = StateProvider((ref) => 1);
final measurementProvider = StateProvider((ref) => false);
final darkModeProvider = StateProvider((ref) => false);

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final darkThemeProvider = StateProvider(
      (ref) => Theme.of(context).brightness == Brightness.dark,
    );
    final isDarkMode = ref.watch(darkThemeProvider);
    final selectedLanguage = ref.watch(languageProvider);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile.navigation(
                title: const Text('Language'),
                value: Text(selectedLanguage),
                leading: const Icon(Icons.language),
                onPressed: (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LanguageSettingsPage(),
                    ),
                  );
                },
              ),
              SettingsTile.switchTile(
                initialValue: ref.watch(darkModeProvider),
                onToggle: (value) {
                  ref.read(darkModeProvider.notifier).state = value;
                  if (value) {
                    setState(() {
                      MyApp.of(context)!.changeTheme(ThemeMode.dark);
                    });
                  } else {
                    setState(() {
                      MyApp.of(context)!.changeTheme(ThemeMode.light);
                    });
                  }
                },
                title: const Text('Dark Mode'),
                leading: const Icon(Icons.brightness_2),
              ),
              SettingsTile.switchTile(
                initialValue: ref.watch(measurementProvider),
                onToggle: (value) =>
                    ref.read(measurementProvider.notifier).state = value,
                title: const Text('Measurement System'),
                leading: const Icon(Icons.architecture),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
