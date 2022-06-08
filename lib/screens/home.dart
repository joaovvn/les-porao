import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesporao/widgets/appBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(true),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        backgroundColor: const Color.fromARGB(255, 102, 186, 255),
        child: const Icon(Icons.login),
        onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BEM-VINDO',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 102, 186, 255),
                      fontSize: MediaQuery.of(context).size.height * 0.15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'AO PORÃO!',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.63,
                  child: Text(
                    'Aqui você pode estar por dentro do seu novo emprego no exterior, desde toda a questão fiscal até a conversão monetária, pode contar com a gente!\nConectamos você com o seu futuro empregador.',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.019,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
