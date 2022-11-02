import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iron_ore_frontend/providers/counterProvider.dart';
import 'package:iron_ore_frontend/providers/serveripProvider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iron-Ore')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('IP entered ${context.watch<ServerIp>().server_address}'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text("Enter Server IP"))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<Counter>().increment(),
            key: Key('Jam'),
            tooltip: 'Jam',
            child: Icon(Icons.play_arrow),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () => context.read<Counter>().reset(),
            key: Key('Pause'),
            tooltip: 'Pause',
            child: Icon(Icons.pause),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () => context.read<Counter>().decrement(),
            key: Key('Stop'),
            tooltip: 'Stop',
            child: Icon(Icons.stop),
          ),
        ],
      ),
    );
  }
}
