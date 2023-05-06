import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stay/router/stay_router.dart';
import 'dart:async';
import 'dart:convert';
import 'package:stay/services/services.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Registro",
      home: Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();


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
                        TextFormField(
                          decoration: InputDecoration(labelText: "Nombre:"),
                          
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
                          decoration: InputDecoration(labelText: "Email:"),
                          
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
                          obscureText: true,
                          
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
                          decoration: InputDecoration(labelText: "Confirmar contraseña:"),
                          obscureText: true,
                          
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextButton(
                            onPressed: () async {
                              
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Registrarse",
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
