import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iron_ore_frontend/providers/mainStateProvider.dart';
import 'package:iron_ore_frontend/additional_widgets/dropdown_button.dart';
import 'package:blur/blur.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iron-Ore'),
        backgroundColor: context.watch<MainState>().accentColour,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(context.watch<MainState>().cover_url),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)))),
            DropDwnButt(),
            SizedBox(
                height: MediaQuery.of(context).size.height /
                    3), // This causes me so much pain it must be fixed
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "PlayBtn",
                  onPressed: () => context.read<MainState>().sendPlay(),
                  key: Key('Jam'),
                  tooltip: 'Jam',
                  child: Icon(Icons.play_arrow),
                ),
                SizedBox(
                  width: 10.0,
                ),
                FloatingActionButton(
                  heroTag: "PauseBtn",
                  onPressed: () => context.read<MainState>().sendPause(),
                  key: Key('Pause'),
                  tooltip: 'Pause',
                  child: Icon(Icons.pause),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "SettingsBtn",
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
