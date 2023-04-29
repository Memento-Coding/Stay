// ignore: file_names
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
          child: Column(
            children: [
              SizedBox(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/logo.png'),
              ),
              const Text(
                '',
                style: TextStyle(fontSize: 400),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 25),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                ),
                child: const Text('Iniciar sesion'),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    '¿No tienes una cuenta? Registrate aqui',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
