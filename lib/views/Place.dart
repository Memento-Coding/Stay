import 'package:flutter/material.dart';
 
void main() {
  runApp(const Place());
}
 
class Place extends StatelessWidget {
  const Place({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hola Pantalla Place")),
    );
  }
}