import 'package:earthquake_app/pages/language_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

final languageProvider = StateProvider((ref) => 'English');
final darkModeProvider = StateProvider((ref) => false);
final measurementProvider = StateProvider((ref) => false);

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkThemeProvider = StateProvider(
      (ref) => Theme.of(context).brightness == Brightness.dark,
    );
    final isDarkMode = ref.watch(darkThemeProvider);

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
                value: const Text('English'),
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
                onToggle: (value) =>
                    ref.read(darkModeProvider.notifier).state = value,
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
