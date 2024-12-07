import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/joke_type_screen.dart';
import 'screens/random_joke_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joke App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/jokes': (context) {
          final type = ModalRoute.of(context)!.settings.arguments as String;
          return JokeTypeScreen(type: type);
        },
        '/random-joke': (context) => const RandomJokeScreen(),
      },
    );
  }
}
