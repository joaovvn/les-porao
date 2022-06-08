import 'package:flutter/material.dart';
import 'package:lesporao/screens/conversionScreen.dart';
import 'package:lesporao/screens/home.dart';
import 'package:lesporao/screens/homeScreen.dart';
import 'package:lesporao/screens/loginScreen.dart';
import 'package:lesporao/screens/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Porão',
      initialRoute: '/',
      theme: ThemeData(fontFamily: 'Roboto', useMaterial3: true),
      routes: {
        '/': (context) => const Home(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/main': ((context) => const MainScreen()),
        '/conversao': ((context) => const ConversionScreen())
      },
    );
  }
}
