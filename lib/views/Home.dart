import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 60),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:  AssetImage('assets/images/fondo-brujula.jpg',),
                  fit: BoxFit.cover
                ),
              ),
            
            
            ),
            Center(
              child: Column(
                children: [
                  
                  SizedBox(
                   height: 200,
                   width: MediaQuery.of(context).size.width,
                   child: Image.asset('assets/images/logo.png'),
                
                          ),
                  Expanded(flex: 3, child: Text('',
                     style: TextStyle(fontSize: 400),),),
                  
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
                  

              Expanded(flex: 1,child: TextButton(onPressed: (){},
               child: Text('¿No tienes una cuenta? Registrate aqui',
               style: TextStyle(
                color: Colors.white,
               ),)))   
              
                
            ],
              ),
            )
            
            
          ],

        ),
       
      );
  }
}