import 'package:flutter/material.dart';
import '../const.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
            image: DecorationImage(
              image:  AssetImage('assets/imagens/fondo.jpg',
              ),
              fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Text("¿Que lugar deseas"
             " visitar hoy?", 
            style:
            TextStyle(
              fontSize: 25,
              color: Colors.white
            ) ,
            )]),
         
        
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding:EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28)
          ),
          
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value){},
                  decoration: InputDecoration(
                    hintText: "Buscar...",
                    hintStyle: TextStyle(color: Colors.black54,fontSize: 17),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon:  Icon(Icons.search)
                  ),
                ),
              ),
            ],
          ),
          
          
        ),
        )
        ],
      ),
      
      
    );
  }
}