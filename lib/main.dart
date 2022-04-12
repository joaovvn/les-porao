import 'package:flutter/material.dart';
import 'package:lesporao/conversionScreen.dart';

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
      theme: ThemeData.dark(),
      home: ConversionScreen(),
    );
  }
}
