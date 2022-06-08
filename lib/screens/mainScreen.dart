import 'package:flutter/material.dart';
import 'package:lesporao/widgets/appBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(true),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () => Navigator.of(context).pushNamed('/conversao'),
              child: const Icon(Icons.currency_exchange),
              elevation: 20,
              backgroundColor: const Color.fromARGB(255, 102, 186, 255)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FloatingActionButton(
                onPressed: () => Navigator.of(context).pushNamed('/listaVagas'),
                child: const Icon(Icons.list),
                elevation: 20,
                backgroundColor: const Color.fromARGB(255, 102, 186, 255)),
          ),
          FloatingActionButton(
              onPressed: () => Navigator.of(context).pushNamed('/'),
              child: const Icon(Icons.logout),
              elevation: 20,
              backgroundColor: const Color.fromARGB(255, 102, 186, 255))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Column(),
    );
  }
}
