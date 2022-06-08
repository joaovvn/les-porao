import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lesporao/controllers/apiController.dart';
import 'package:lesporao/widgets/appBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController senhaController = TextEditingController();
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: appBar(false),
      body: isLandScape
          ? Center(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          Color.fromARGB(255, 102, 186, 255)
                        ]),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Text(
                          'Você aqui de novo?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
                          cursorColor: Colors.black,
                          cursorHeight:
                              MediaQuery.of(context).size.height * 0.02,
                          style: const TextStyle(color: Colors.black),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              icon: const Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              labelText: "E-mail",
                              labelStyle: const TextStyle(color: Colors.black)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
                          onSubmitted: (String) async => await logar(
                              emailController.text,
                              senhaController.text,
                              context),
                          cursorColor: Colors.black,
                          cursorHeight:
                              MediaQuery.of(context).size.height * 0.02,
                          style: const TextStyle(color: Colors.black),
                          controller: senhaController,
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              icon: const Icon(
                                Icons.password,
                                color: Colors.black,
                              ),
                              labelText: "Senha",
                              labelStyle: const TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.08,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(3),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 147, 206, 255)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  side: MaterialStateProperty.all(
                                      const BorderSide(color: Colors.black))),
                              onPressed: () async {
                                await logar(emailController.text,
                                    senhaController.text, context);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.012),
                              )))
                    ]),
              ),
            )
          : Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Você aqui de novo?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.035),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          cursorColor: Colors.black,
                          cursorHeight:
                              MediaQuery.of(context).size.height * 0.02,
                          style: const TextStyle(color: Colors.black),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              icon: const Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              labelText: "E-mail",
                              labelStyle: const TextStyle(color: Colors.black)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          cursorColor: Colors.black,
                          cursorHeight:
                              MediaQuery.of(context).size.height * 0.02,
                          style: const TextStyle(color: Colors.black),
                          controller: senhaController,
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              icon: const Icon(
                                Icons.password,
                                color: Colors.black,
                              ),
                              labelText: "Senha",
                              labelStyle: const TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.055,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  side: MaterialStateProperty.all(
                                      const BorderSide(color: Colors.black))),
                              onPressed: () async {
                                await login(
                                    email: emailController.text,
                                    senha: senhaController.text);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.019),
                              )))
                    ]),
              ),
            ),
    );
  }
}

logar(String email, String senha, BuildContext context) async {
  var response = await login(email: email, senha: senha);
  if (response == 200) {
    Navigator.pushNamed(context, '/main');
  } else if (response == 0) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text(
                'Usuário não autorizado!',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.red,
            ));
  }
}
