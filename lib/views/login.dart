import 'package:flutter/material.dart';

class StayLogin extends StatelessWidget {
  const StayLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Log-in",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fondo-brujula.jpg'),
                      fit: BoxFit.cover),
                ),
                padding: const EdgeInsets.only(top: 60.0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 150.0,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                                alignment: Alignment.topCenter)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white),
                      margin: const EdgeInsets.only(top: 100.0),
                      padding: const EdgeInsets.all(30.0),
                      child: Column(children: <Widget>[
                        const Text(
                          "Bienvenido a Stay",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 60.0),
                          child: const TextField(
                            decoration: InputDecoration(
                                hintText: "E-mail",
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Contraseña",
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30.0),
                          child: TextButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.all(15.0),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(context, '/register');
                            },
                            child: const Text(
                              'Iniciar Sesion',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: const Text(
                            "¿Olvidaste tu contraseña?",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                ))));
  }
}
