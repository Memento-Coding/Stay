import 'package:flutter/material.dart';
import 'package:stay/models/SitioTuristico.dart';
 
void main() {
  runApp(const Place());
}
 
class Place extends StatelessWidget {
  const Place({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final argumento = ModalRoute.of(context)?.settings.arguments as SitioTuristico;
    return Scaffold(
      body: Center(child: Text("Hola ${argumento.nombre}")),
    );
  }
}