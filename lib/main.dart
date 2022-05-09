import 'package:flutter/material.dart';
import 'package:firebase_crud/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/themes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            title: 'Firebase CRUD',
            debugShowCheckedModeBanner: false,
            home: NavScreen(),
          );
        },
      );
}
