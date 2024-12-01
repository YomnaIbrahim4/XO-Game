import 'package:flutter/material.dart';
import 'package:xo_game/boardscreen.dart';
import 'package:xo_game/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: LogInSCreen.routeName,
      routes: {
        BoardScreen.routeName :(_)=>BoardScreen(),
        LogInSCreen.routeName:(_)=>LogInSCreen(),
      },
    );
  }
}


