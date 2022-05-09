import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_crud/themes.dart';
import 'dart:io' show Platform;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool dark = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          ListTile(
            title: const Text(
              'Dark mode',
            ),
            trailing: Platform.isIOS
                ? CupertinoSwitch(
                    value: themeProvider.isDark,
                    onChanged: (value) {
                      final provider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      setState(() {
                        dark = value;
                      });
                      provider.toggleTheme(value);
                    },
                  )
                : Switch(
                    value: themeProvider.isDark,
                    onChanged: (value) {
                      final provider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      setState(() {
                        dark = value;
                      });
                      provider.toggleTheme(value);
                    },
                  ),
          ),
        ]),
      ),
    );
  }
}
