import 'package:earthquake_app/pages/my_home_page.dart';
import 'package:earthquake_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSettingsPage extends ConsumerWidget {
  const LanguageSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkThemeProvider = StateProvider(
      (ref) => Theme.of(context).brightness == Brightness.dark,
    );
    final isDarkMode = ref.watch(darkThemeProvider);
    final languages = ['English', 'Turkish'];

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
      body: ColoredBox(
        color: const Color(0xff1b1b1b),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(languages[index]),
              trailing: Radio(
                value: languages[index],
                groupValue: ref.read(languageProvider.notifier).state,
                onChanged: (String? value) =>
                    ref.read(languageProvider.notifier).state != value,
              ),
              onTap: () {},
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
            );
          },
          itemCount: 2,
        ),
      ),
    );
  }
}
