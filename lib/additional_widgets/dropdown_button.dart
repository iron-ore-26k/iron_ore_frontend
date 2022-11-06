import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iron_ore_frontend/providers/mainStateProvider.dart';

const List<String> list = <String>[
  'The Wreck of the Edmund Fitzgerald',
  'Fortunate Son',
];

class DropDwnButt extends StatefulWidget {
  const DropDwnButt({super.key});

  @override
  State<DropDwnButt> createState() => _DropDwnButtState();
}

class _DropDwnButtState extends State<DropDwnButt> {
  String dropdownValue = list.first;

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
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      underline: Container(
        height: 2,
        color: context.watch<MainState>().accentColour,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
        context.read<MainState>().setSelectedSong(value!);
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
