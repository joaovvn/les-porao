import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 30),
            child: kIsWeb
                ? Image.network("assets/assets/iconPorao.png")
                : Image.asset("iconPorao.png"),
          ),
          title: const Center(
              child: Text(
            'Porão',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
        ),
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
                        color: Colors.blue),
                    width: MediaQuery.of(context).size.height * 0.15,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: kIsWeb
                        ? Image.network("assets/assets/dolarEuro.png")
                        : Image.asset("dolarEuro.png"),
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
                          ? conversion = 4.64
                          : conversion = 5.05;
                      inputValue != 0
                          ? outputController.text =
                              (inputValue * conversion).toStringAsFixed(2)
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
                          color: Colors.blue),
                      width: MediaQuery.of(context).size.height * 0.15,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: kIsWeb
                          ? Image.network("assets/assets/real.png")
                          : Image.asset("real.png"),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.15,
                    child: TextField(
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      controller: outputController,
                      decoration: const InputDecoration(prefix: Text('BRL ')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
