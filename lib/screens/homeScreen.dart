import 'package:flutter/material.dart';
import 'package:lesporao/controllers/apiController.dart';
import 'package:lesporao/widgets/appBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController senhaController = TextEditingController();
    return Scaffold(
        appBar: appBar(true),
        body: Center(
          child: isLandScape
              ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(20))),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.005),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bem-vindo de volta!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(
                              "Já possui uma conta?\nFaça o login novamente",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.010),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.08,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      side: MaterialStateProperty.all(
                                          const BorderSide(
                                              color: Colors.white))),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/login');
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.012),
                                  )))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(20)),
                        color: Color.fromARGB(255, 122, 195, 255)),
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Criar Conta",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(
                            cursorColor: Colors.black,
                            cursorHeight:
                                MediaQuery.of(context).size.height * 0.02,
                            style: const TextStyle(color: Colors.black),
                            controller: nomeController,
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
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                labelText: "Nome",
                                labelStyle:
                                    const TextStyle(color: Colors.black)),
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
                                labelStyle:
                                    const TextStyle(color: Colors.black)),
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
                                labelStyle:
                                    const TextStyle(color: Colors.black)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.08,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 122, 195, 255)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      side: MaterialStateProperty.all(
                                          const BorderSide(
                                              color: Colors.black))),
                                  onPressed: () async {
                                    bool isComplete =
                                        nomeController.text.isNotEmpty &
                                            emailController.text.isNotEmpty &
                                            senhaController.text.isNotEmpty;
                                    if (isComplete) {
                                      var response = await cadastro(
                                          nome: nomeController.text,
                                          email: emailController.text,
                                          senha: senhaController.text);
                                      if (response == 201) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 40, top: 10),
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 122, 195, 255),
                                                  title: const Center(
                                                      child: Text(
                                                    'Usuário cadastrado com sucesso!',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                                  actions: [
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Colors
                                                                            .white)),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              login(
                                                                  email:
                                                                      emailController
                                                                          .text,
                                                                  senha:
                                                                      senhaController
                                                                          .text);
                                                            },
                                                            child: const Text(
                                                              'OK',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                ));
                                      }
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 40, top: 10),
                                                backgroundColor: Colors.red,
                                                title: const Center(
                                                    child: Text(
                                                        'Erro ao Cadastrar')),
                                                content: const Text(
                                                    'Complete todos os campos!'),
                                                actions: [
                                                  Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .white)),
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                          child: const Text(
                                                            'OK',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          )),
                                                    ),
                                                  )
                                                ],
                                              ));
                                    }
                                  },
                                  child: Text(
                                    "Cadastrar",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.012),
                                  ))),
                        )
                      ],
                    ),
                  )
                ])
              : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.005),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bem-vindo de volta!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(
                              "Já possui uma conta?\nFaça o login novamente",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      side: MaterialStateProperty.all(
                                          const BorderSide(
                                              color: Colors.white))),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/login');
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  )))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20)),
                        color: Color.fromARGB(255, 122, 195, 255)),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Criar Conta",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          height: MediaQuery.of(context).size.height * 0.065,
                          child: TextField(
                            controller: nomeController,
                            cursorColor: Colors.black,
                            cursorHeight:
                                MediaQuery.of(context).size.height * 0.02,
                            style: const TextStyle(color: Colors.black),
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
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                labelText: "Nome",
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.019)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          height: MediaQuery.of(context).size.height * 0.065,
                          child: TextField(
                            controller: emailController,
                            cursorColor: Colors.black,
                            cursorHeight:
                                MediaQuery.of(context).size.height * 0.02,
                            style: const TextStyle(color: Colors.black),
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
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.019)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          height: MediaQuery.of(context).size.height * 0.068,
                          child: TextField(
                            controller: senhaController,
                            cursorColor: Colors.black,
                            cursorHeight:
                                MediaQuery.of(context).size.height * 0.02,
                            style: const TextStyle(color: Colors.black),
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
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.019)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 122, 195, 255)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      side: MaterialStateProperty.all(
                                          const BorderSide(
                                              color: Colors.black))),
                                  onPressed: () async {
                                    bool isComplete =
                                        nomeController.text.isNotEmpty &
                                            emailController.text.isNotEmpty &
                                            senhaController.text.isNotEmpty;
                                    if (isComplete) {
                                      var response = await cadastro(
                                          nome: nomeController.text,
                                          email: emailController.text,
                                          senha: senhaController.text);
                                      if (response == 201) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  alignment: Alignment.center,
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 122, 195, 255),
                                                  title: const Center(
                                                      child: Text(
                                                    'Usuário cadastrado com sucesso!',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                                  actions: [
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Colors
                                                                            .white)),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              login(
                                                                  email:
                                                                      emailController
                                                                          .text,
                                                                  senha:
                                                                      senhaController
                                                                          .text);
                                                            },
                                                            child: const Text(
                                                              'OK',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                ));
                                      }
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 40, top: 10),
                                                backgroundColor: Colors.red,
                                                title: const Center(
                                                    child: Text(
                                                        'Erro ao Cadastrar')),
                                                content: const Text(
                                                    'Complete todos os campos!'),
                                                actions: [
                                                  Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .white)),
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                          child: const Text(
                                                            'OK',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          )),
                                                    ),
                                                  )
                                                ],
                                              ));
                                    }
                                  },
                                  child: Text(
                                    "Cadastrar",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  ))),
                        )
                      ],
                    ),
                  )
                ]),
        ));
  }
}
