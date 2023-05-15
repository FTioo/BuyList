import 'package:buylist/Provider/database_provider.dart';
import 'package:buylist/Screen/add_page.dart';
import 'package:buylist/Screen/home_page.dart';
import 'package:buylist/Services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: ThemeMode.dark,
        routes: {
          '/': (context) => const HomePage(),
          '/add': (context) => AddScreen(),
          // '/' :(context) => const HomePage(),
        },
      ),
    );
  }
}
