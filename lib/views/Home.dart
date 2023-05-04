import 'package:flutter/material.dart';
 
void main() {
  runApp(const Home());
}
 
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hola Pantalla Home")),
    );
  }
}