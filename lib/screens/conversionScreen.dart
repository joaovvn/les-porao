import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesporao/controllers/apiController.dart';
import 'package:lesporao/models/currency.dart';
import 'package:lesporao/widgets/appBar.dart';

class ConversionScreen extends StatefulWidget {
  const ConversionScreen({Key? key}) : super(key: key);

  @override
  State<ConversionScreen> createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();
  String selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getConversion(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> dados = snapshot.data as Map<String, dynamic>;
            return Scaffold(
                appBar: appBar(true),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.miniEndTop,
                floatingActionButton: FloatingActionButton(
                    onPressed: () => Navigator.of(context).pushNamed('/main'),
                    child: const Icon(Icons.keyboard_return),
                    elevation: 20,
                    backgroundColor: const Color.fromARGB(255, 102, 186, 255)),
                body: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color:
                                    const Color.fromARGB(255, 102, 186, 255)),
                            width: MediaQuery.of(context).size.height * 0.15,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: kIsWeb
                                ? Image.network(
                                    "assets/assets/dolarEuro.png",
                                    color: Colors.white,
                                  )
                                : Image.asset(
                                    "dolarEuro.png",
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.15,
                          child: DropdownButton(
                              isExpanded: true,
                              value: selectedCurrency,
                              items: const [
                                DropdownMenuItem(
                                  child: Text("Dólar"),
                                  value: 'USD',
                                ),
                                DropdownMenuItem(
                                  child: Text("Euro"),
                                  value: 'EUR',
                                )
                              ],
                              onChanged: (value) {
                                inputController.text = '';
                                outputController.text = '';
                                selectedCurrency = value.toString();
                                setState(() {});
                              }),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.15,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: inputController,
                            decoration: InputDecoration(
                              prefix: Text('$selectedCurrency '),
                            ),
                            onChanged: (value) {
                              var inputValue = inputController.text.isNotEmpty
                                  ? double.parse(inputController.text)
                                  : 0;
                              double conversion;
                              selectedCurrency == 'USD'
                                  ? conversion = dados["results"]["currencies"]
                                      ["USD"]["sell"]
                                  : conversion = dados["results"]["currencies"]
                                      ["EUR"]["sell"];
                              inputValue != 0
                                  ? outputController.text =
                                      (inputValue * conversion)
                                          .toStringAsFixed(2)
                                  : outputController.text = '';
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color:
                                      const Color.fromARGB(255, 102, 186, 255)),
                              width: MediaQuery.of(context).size.height * 0.15,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: kIsWeb
                                  ? Image.network(
                                      "assets/assets/real.png",
                                      color: Colors.white,
                                    )
                                  : Image.asset(
                                      "real.png",
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.15,
                            child: TextField(
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              controller: outputController,
                              decoration:
                                  const InputDecoration(prefix: Text('BRL ')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          } else {
            return const Center(
                child:
                    SizedBox(height: 30, child: CircularProgressIndicator()));
          }
        });
  }
}
