import 'dart:convert';
import 'dart:html';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stay/components/homeBar.dart';
import 'package:stay/components/title_with_morebtn.dart';
import 'package:stay/models/gif.dart';

import '../const.dart';
import 'header_with_search.dart';
import 'package:http/http.dart' as http;

class Evento {
  final String nombre;
  final String descripcion;
  final String fechaHora;

  Evento({
    required this.nombre,
    required this.descripcion,
    required this.fechaHora,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      fechaHora: json['fecha_hora'],
    );
  }
}


class Body extends StatefulWidget { 

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String token;
  String titulo = '';
  String descripcion = '';
  String fecha = '';
  String responseData = '';
  List<dynamic> nombre = [];
  final storage = const FlutterSecureStorage();

  @override
  void initState(){
    super.initState();
    /*token = await storage.read(key: 'jwt') ?? '';*/
    fetchData();
  }


  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://stay-back-production.up.railway.app/v1/evento'),
      headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvX2lkIjoxOSwicm9sX2lkIjo0LCJub21icmUiOiJzb3llbEFkbWluIiwiY29ycmVvX2VsZWN0cm9uaWNvIjoic3VqZXRvYWRtaW5pc3RyYWRvckBnbWFpbC5jb20iLCJmb3RvIjoiaHR0cHM6Ly9yZXMuY2xvdWRpbmFyeS5jb20vZG1ieWl6emNkL2ltYWdlL3VwbG9hZC92MTY4MzYwMjc2My9qbDcyMTk1b2tzcHpuc2Zzc2RreC5qcGciLCJpYXQiOjE2ODM3NzYzNzIsImV4cCI6MTY4Mzc5Nzk3Mn0.lcOa4tIRYiHHV09yDjeJ8g__TpGkGrMBwsHHNe35Fqo', 'Content-Type': 'application/json; charset=UTF-8'},

    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("d");
      final data = jsonDecode(response.body);
      print(data);

      setState(() {
        nombre=data;
      });
      print(response);
    } else {
      setState(() {
        responseData = 'Error al cargar los datos de la API';
      });
    }
  }


 @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(titulo);
    print(descripcion);
    return Center(
      child:Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWithSearchBox(size: size),
          TittleWithMorebtn(
            title: "Recomendaciones",
            press: (){},
          ),
          
          Column(
            children: [
              Expanded(child: ListView.builder(
                itemCount: nombre.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = nombre[index];
                  return RecomendadeEventCard(
                    title: data["nombre"],
                    description:data["descripcion"],
                    date:data["fecha_hora"],
                    /*price: precio,*/
                    press: (){},

                  );

                },
              ),)
              
              
            ],

          
          ),
            ],
          ),

        ),
    
    
      ),
    
      
    
      
    );
    
    
  }
}










class RecomendadeEventCard extends StatelessWidget {
  const RecomendadeEventCard({
    Key? key, 
     
     required this.title,
     required this.description,
     required this.date,
     /*required this.price,*/
     required this.press,
  
  }) : super(key: key);

  final String title,date,description;
  /*final int price;*/
  final Function press;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding / 2, bottom: kDefaultPadding * 2.5),
      width: size.width * 0.5,
      child: Column(
        children: [
       
          GestureDetector(
            onTap: press(),
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                ),
                boxShadow:[
                 BoxShadow(
                  offset:Offset(0,10),
                  blurRadius: 30,
                  color: kPrimaryColor.withOpacity(0.3)
          
                 ),
                ],
              ),
              child: Column(
                children: [
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$title\n", 
                        style: Theme.of(context).textTheme.button
                        ),
                      TextSpan(
                          text: "$description\n" ,
                          style: TextStyle(
                            color: Colors.red
                          ),
                        ),
                        TextSpan(
                          text: "$date\n" ,
                          style: TextStyle(
                            color: Colors.red
                          ),
                        ),
          
                      /*TextSpan(
                      text: "\$$price" ,
                          style: TextStyle(
                            color: Colors.blue
                          ),
                        ),*/
                    ],
                  
          
                  ),
                  
                  
                  
                 ),
                 
              
          
                ],
              ),
          
          
            ),
          ),

        ],
        ),
    );
  }
}


