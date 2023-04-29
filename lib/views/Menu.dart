import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu extends StatelessWidget{
  const Menu({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: const Center(
        child: Text("Hola"),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          color: Colors.black
        ),
      ),
    );
  }




}