import 'package:flutter/material.dart';
import 'package:iron_ore_frontend/providers/counterProvider.dart';
import 'package:iron_ore_frontend/providers/serveripProvider.dart';
import 'package:iron_ore_frontend/screens/homeScreen.dart';
import 'package:iron_ore_frontend/screens/secondScreen.dart';
import 'package:provider/provider.dart';
// import 'package:protobuf/protobuf.dart';
// import './gen/protobuf/ore/service.pb.dart';
// import './gen/protobuf/ore/songs.pb.dart';
// import './gen/protobuf/ore/service.pbserver.dart';
// import 'package:grpc/grpc.dart';

int portNo = 8080; // Remove later

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => ServerIp()),
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
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': ((context) => MyHomePage()),
        '/second': ((context) => SecondPage())
      },
    );
  }
}
