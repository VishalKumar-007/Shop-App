import 'package:flutter/material.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        // sets fontFamily for all texts
        fontFamily: 'Lato',
        // sets overall theme for the app
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),
        ),
        // sets appBar property for all appBars
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          // sets hintText style for all hintTexts
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          // sets icon color for all prefix icons
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        // set textStyles for the app
        textTheme: const TextTheme(
          // for screen title of all screens
          titleLarge: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          // for product name text
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          // for product prices text
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
