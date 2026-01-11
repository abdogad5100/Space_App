import 'package:flutter/material.dart';
import 'package:space_app/ui/home_page.dart';
import 'package:space_app/ui/planets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        PlanetsPage.routeName: (context) => PlanetsPage(),
      },
    );
  }
}
