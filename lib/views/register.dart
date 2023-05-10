import 'package:flutter/material.dart';
import 'package:stay/models/user.dart';
import 'package:stay/viewsmodels/UserHttp.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final nombre = TextEditingController();
  final email = TextEditingController();
  final passwrod = TextEditingController();
  final writePasswrod = TextEditingController();


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


                        //CAMPO NOMBRE
                        TextFormField(
                          controller: nombre,
                          decoration:
                              const InputDecoration(labelText: "Nombre:"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),


                        const SizedBox(
                          height: 40,
                        ),

                        //CAMPO EMAIL
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: const InputDecoration(labelText: "Email:"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),


                        //CAMPO CONTRASEÑA
                        TextFormField(
                          controller: passwrod,
                          decoration: const InputDecoration(labelText: "Contraseña:"),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),


                        const SizedBox(
                          height: 40,
                        ),
                        //CAMPO CONFIRMAR CONTRASEÑA
                        TextFormField(
                          controller: writePasswrod,
                          decoration: const InputDecoration(
                              labelText: "Confirmar contraseña:"),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextButton(
                            onPressed: () async {
                              if(passwrod.text == writePasswrod.text){
                                User user = User(password: passwrod.text, correoElectronico: email.text, nombreUsuario: nombre.text, rolId: 1);
                                UserHttp userHttp = UserHttp();
                                userHttp.registrarse(user);
                              }                           
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  "Registrarse",
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
