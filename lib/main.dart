import 'package:flutter/material.dart';
import 'package:iron_ore_frontend/providers/mainStateProvider.dart';
import 'package:iron_ore_frontend/screens/homeScreen.dart';
import 'package:iron_ore_frontend/screens/secondScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                MainState()), // Provider for the core state of the app
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var colourField = Colors.amber;
    switch (context.watch<MainState>().selected_song_idx) {
      case 1:
        colourField = Colors.blue;
        break;
      case 2:
        colourField = Colors.red;
        break;
    }
    return MaterialApp(
      theme: ThemeData(primarySwatch: colourField),
      initialRoute: '/',
      routes: {
        '/': ((context) => MyHomePage()),
        '/second': ((context) => SecondPage())
      },
    );
  }
}
