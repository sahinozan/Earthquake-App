import 'package:earthquake_app/main.dart';
import 'package:earthquake_app/pages/language_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

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
              SettingsTile.navigation(
                title: const Text('Source'),
                description: const Text('US Geological Survey (USGS)'),
                leading: const Icon(Icons.source),
                // trailing: const Icon(Icons.open_in_new),
                trailing: IconButton(
                  icon: const Icon(Icons.open_in_new),
                  onPressed: () async {
                    var url = Uri.parse('https://earthquake.usgs.gov/');
                    if (!await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              SettingsTile(
                title: const Text('Version'),
                description: const Text('1.0.0'),
                leading: const Icon(Icons.info),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
