import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesporao/controllers/apiController.dart';
import 'package:lesporao/widgets/appBar.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, this.isCompany}) : super(key: key);

  bool? isCompany;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: appBar(true),
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.isCompany == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: FloatingActionButton(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed('/criarVagas'),
                              child: const Icon(Icons.add),
                              elevation: 20,
                              backgroundColor:
                                  const Color.fromARGB(255, 102, 186, 255)),
                        )
                      : Container(),
                  FloatingActionButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/conversao'),
                      child: const Icon(Icons.currency_exchange),
                      elevation: 20,
                      backgroundColor:
                          const Color.fromARGB(255, 102, 186, 255)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FloatingActionButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/listaVagas'),
                        child: const Icon(Icons.list),
                        elevation: 20,
                        backgroundColor:
                            const Color.fromARGB(255, 102, 186, 255)),
                  ),
                  FloatingActionButton(
                      onPressed: () => Navigator.of(context).pushNamed('/'),
                      child: const Icon(Icons.logout),
                      elevation: 20,
                      backgroundColor: const Color.fromARGB(255, 102, 186, 255))
                ],
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
              body: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      "assets/assets/background.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'VAGAS RECENTES',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(
                            dragDevices: {
                              PointerDeviceKind.touch,
                              PointerDeviceKind.mouse,
                            },
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 3,
                                          blurStyle: BlurStyle.outer)
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 102, 186, 255),
                                          Colors.black
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
                child:
                    SizedBox(height: 30, child: CircularProgressIndicator()));
          }
        });
  }
}
