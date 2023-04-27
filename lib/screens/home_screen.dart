import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imagens/fondo.jpg'),
              fit: BoxFit.cover
            ),
            
          ),
          
          
          child: Column(
            children: [
              SizedBox(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/imagens/logo.png'),
                
              ),
              Text('',
              style: TextStyle(fontSize: 400),),
              
              TextButton(onPressed: (){},
              
               style: TextButton.styleFrom(
                
                 primary: Colors.white,
                 textStyle: TextStyle(fontSize: 25),
               shape: BeveledRectangleBorder(
                 borderRadius: BorderRadius.circular(5)
                ),
               backgroundColor: Colors.red,
               padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                ),
               child:Text('Iniciar sesion'),               
              ),
              TextButton(onPressed: (){},
               child: Text('¿No tienes una cuenta? Registrate aqui',
               style: TextStyle(
                color: Colors.white,
               ),))
                
            ],
          
          ),
        
         ),
       

        ),
        
        
      );

    }
}