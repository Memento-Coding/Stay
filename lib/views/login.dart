import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stay/router/stay_router.dart';
import 'dart:async';
import 'dart:convert';
import 'package:stay/services/services.dart';

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
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();

  String em = '';
  String pas = '';

  void ingresar(email, pass) async {
    try {
      var url = Uri.https('');
      var response = await http.post(url, body: {
        'Email': email,
        'Password': pass,
      }).timeout(const Duration(seconds: 100));

      var datos = jsonDecode(response.body);

      print(datos);

      if (response.body != '1') {
        Navigator.pushNamed(context, '/register', arguments: {
          'email': datos['email'],
          'password': datos['password']
        });

        //map parametros = ModalRoute.of(context).settings.arguments;

        FocusScope.of(context).unfocus();
      }
    } on TimeoutException catch (e) {
      print('Tarda mucho');
    } on Error catch (e) {
      print('HTTP ERROR');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(vertical: 60),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fondo-brujula.jpg'),
                      fit: BoxFit.cover)),
              child: Image.asset(
                'assets/images/logo.png',
                alignment: Alignment.topCenter,
                width: 200,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Bienvenido a Stay",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "E-mail:"),
                          controller: email,
                          onChanged: (value) => {
                            
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Contraseña:"),
                          onChanged: (value) => {
                            
                          },
                          obscureText: true,
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              em = email.text;
                              pas = password.text;

                              print(em);
                              print(pas);

                              if (em != '' && pas != '') {
                                ingresar(em, pas);
                              } else {
                                // El inicio de sesión falló. Mostrar un mensaje de error.
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Inicio de sesión fallido'),
                                    content: Text(
                                        'El email o la contraseña son incorrectos.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Iniciar Sesión",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('¿No estas registrado?'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/register');
                              },
                              child: Text("Registrarse"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget login(c) {
  return Container(
    width: MediaQuery.of(c).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40), color: Colors.white),
    margin: const EdgeInsets.only(top: 100.0),
    padding: const EdgeInsets.all(30.0),
    child: Column(children: <Widget>[
      bienvenido(),
      campoEmail(),
      campoPassword(),
      botonIniciar(c),
      olvido()
    ]),
  );
}

Widget bienvenido() {
  return const Text(
    "Bienvenido a Stay",
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
  );
}

Widget campoEmail() {
  return Container(
    margin: const EdgeInsets.only(top: 60.0),
    child: const TextField(
      decoration: InputDecoration(
          hintText: "E-mail", filled: true, fillColor: Colors.white),
    ),
  );
}

Widget campoPassword() {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Contraseña", filled: true, fillColor: Colors.white),
    ),
  );
}

Widget botonIniciar(c) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      padding: EdgeInsets.all(15.0),
    ),
    onPressed: () {
      Navigator.pushNamed(c, '/home');
    },
    child: const Text(
      'Iniciar Sesion',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),
    ),
  );
}

Widget olvido() {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    child: const Text(
      "¿Olvidaste tu contraseña?",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );
}
