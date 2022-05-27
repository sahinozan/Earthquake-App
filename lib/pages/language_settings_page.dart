import 'package:earthquake_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSettingsPage extends ConsumerStatefulWidget {
  const LanguageSettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LanguageSettingsPage> createState() =>
      _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends ConsumerState<LanguageSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final darkThemeProvider = StateProvider(
      (ref) => Theme.of(context).brightness == Brightness.dark,
    );
    final isDarkMode = ref.watch(darkThemeProvider);
    final languages = ['English', 'Turkish'];
    final selectedRadioButton =
        ref.watch(languageSettingsButtonProvider.notifier);
    int selectedItem = ref.watch(indexProvider.notifier).state;

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
                value:
                    selectedRadioButton.state == index ? index : selectedItem,
                groupValue:
                    selectedRadioButton.state == index ? selectedItem : index,
                onChanged: (value) {
                  ref.read(languageSettingsButtonProvider.notifier).state =
                      index;
                  ref.read(languageProvider.notifier).state = languages[index];
                  ref.read(indexProvider.notifier).state = index;
                  setState(() {
                    selectedItem = index;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${languages[index]} selected',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.grey.shade800,
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
              onTap: () {},
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
              height: 0,
            );
          },
          itemCount: 2,
        ),
      ),
    );
  }
}
