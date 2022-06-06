import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_activity/core/constants/constants.dart';
import 'package:random_activity/feature/random_activity/display/pages/landing_page.dart';

import 'feature/random_activity/display/pages/random_activity_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => RandomActivityProvider()),
      ],
      child: MaterialApp(
        title: Constants.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 30,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            color: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LandingPage();
  }
}
