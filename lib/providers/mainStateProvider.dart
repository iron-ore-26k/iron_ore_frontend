import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:iron_ore_frontend/gen/protobuf/ore/service.pbgrpc.dart';
import 'package:iron_ore_frontend/gen/protobuf/ore/songs.pb.dart';
import 'package:iron_ore_frontend/screens/homeScreen.dart';
import 'package:protobuf/protobuf.dart';
import 'package:palette_generator/palette_generator.dart';

import 'dart:developer';

class MainState with ChangeNotifier {
  _serv backend = _serv();

  String _cover_url =
      "https://upload.wikimedia.org/wikipedia/en/c/c5/Album_Summertime_Dream.jpg";
  String get cover_url => _cover_url;

  Color _accentColour = Colors.black;
  Color get accentColour => _accentColour;

  String _server_address = "localhost"; // Default
  String get server_address => _server_address;

  String _selected_song = "Wreck of the Edmund Fitzgerald";
  String get selected_song => _selected_song;

  int _selected_song_idx = 1;
  int get selected_song_idx => _selected_song_idx;

  // Update song for display and song index
  void setSelectedSong(String newSongSelection) {
    _selected_song = newSongSelection;
    switch (newSongSelection) {
      case "The Wreck of the Edmund Fitzgerald":
        backend.songChoice = Song.SONG_WRECK_OF_EDMUND_FITZGERALD;
        _selected_song_idx = 1;
        _cover_url =
            "https://upload.wikimedia.org/wikipedia/en/c/c5/Album_Summertime_Dream.jpg";
        getImagePalette(NetworkImage(_cover_url))
            .then((data) => {_accentColour = data!});
        break;
      case "Fortunate Son":
        backend.songChoice = Song.SONG_FORTUNATE_SON;
        _selected_song_idx = 2;
        _cover_url =
            "https://upload.wikimedia.org/wikipedia/en/8/85/Willy_and_the_poor_boys.jpg";
        getImagePalette(NetworkImage(_cover_url))
            .then((data) => {_accentColour = data!});
        break;
    }
    notifyListeners();
  }

  // Update target backend address at runtime
  void setAddress(String newAdress) {
    _server_address = newAdress;
    backend._updateServer(newAdress);
    notifyListeners();
  }

  void sendPause() {
    backend._sendGrpcPause();
    notifyListeners();
  }

  void sendPlay() {
    backend._sendGrpcPlay();
    notifyListeners();
  }
}

/*    Provides a future which resolves into a pallete according to an image */
Future<Color?> getImagePalette(ImageProvider imageProvider) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(imageProvider);
  return paletteGenerator.dominantColor?.color;
}

class _serv {
  var songChoice =
      Song.SONG_WRECK_OF_EDMUND_FITZGERALD; // Song to play, default

/*      Initialize channel using localhost  */
  OreServiceClient client = OreServiceClient(
    ClientChannel(
      'localhost',
      port: 50054,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    ),
  );

  /*      Update channel  */
  void _updateServer(String serverIP) {
    OreServiceClient client = OreServiceClient(
      ClientChannel(
        serverIP,
        port: 50054,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      ),
    );
  }

  /*  Call server and ask for the goat  */
  void _sendGrpcPlay() async {
    var response =
        await client.playSong(PlaySongRequest()..songToPlay = songChoice);
  }

  /*  Call server and ask for the pause  */
  void _sendGrpcPause() async {
    var response = await client.pause(PauseRequest());
  }
}
