import 'package:flutter/material.dart';
import 'package:stay/viewsmodels/UserHttp.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();
  UserHttp userHttp = UserHttp();

  final email = TextEditingController();
  final password = TextEditingController();


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
              padding: const EdgeInsets.symmetric(vertical: 60),
              decoration: const BoxDecoration(
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
                        const Text(
                          "Bienvenido a Stay",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: "E-mail:"),
                          controller: email,
                          onChanged: (value) => {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: "Contraseña:"),
                          onChanged: (value) => {},
                          obscureText: true,
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await userHttp.iniciarSesion(context,storage,email.text, password.text);
                              String token = await storage.read(key: 'jwt') ?? '';
                              print(token);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  "Iniciar Sesión",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('¿No estas registrado?'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/register');
                              },
                              child: const Text("Registrarse"),
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
      padding: const EdgeInsets.all(15.0),
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
