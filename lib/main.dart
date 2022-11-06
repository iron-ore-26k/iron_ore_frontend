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
    // var colourField = Colors.amber;
    // switch (context.watch<MainState>().selected_song_idx) {
    //   case 1:
    //     colourField = Colors.blue;
    //     break;
    //   case 2:
    //     colourField = Colors.red;
    //     break;
    // }
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: context.watch<MainState>().accentColour,
        primaryColorDark: context.watch<MainState>().accentColour,
        secondaryHeaderColor: context.watch<MainState>().accentColour,
        toggleableActiveColor: context.watch<MainState>().accentColour,
        cardColor: context.watch<MainState>().accentColour,
        bottomAppBarColor: context.watch<MainState>().accentColour,
        dialogBackgroundColor: context.watch<MainState>().accentColour,
        indicatorColor: context.watch<MainState>().accentColour,
        dividerColor: context.watch<MainState>().accentColour.withOpacity(0.12),
        applyElevationOverlayColor: true,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: context.watch<MainState>().accentColour),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    context.watch<MainState>().accentColour))),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: context.watch<MainState>().accentColour,
        primaryColorDark: context.watch<MainState>().accentColour,
        secondaryHeaderColor: context.watch<MainState>().accentColour,
        toggleableActiveColor: context.watch<MainState>().accentColour,
        cardColor: context.watch<MainState>().accentColour,
        bottomAppBarColor: context.watch<MainState>().accentColour,
        dialogBackgroundColor: context.watch<MainState>().accentColour,
        indicatorColor: context.watch<MainState>().accentColour,
        dividerColor: context.watch<MainState>().accentColour.withOpacity(0.12),
        applyElevationOverlayColor: true,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: context.watch<MainState>().accentColour),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    context.watch<MainState>().accentColour))),
      ),
      initialRoute: '/',
      routes: {
        '/': ((context) => MyHomePage()),
        '/second': ((context) => SecondPage())
      },
    );
  }
}
