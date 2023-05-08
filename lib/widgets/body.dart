

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stay/widgets/homeBar.dart';
import 'package:stay/widgets/title_with_morebtn.dart';
import 'package:stay/models/gif.dart';

import '../const.dart';
import 'header_with_search.dart';
import 'package:http/http.dart' as http;


class Body extends StatefulWidget { 

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  /*Future<List<Gif>> _listadoGifs;*/

  Future<List<Gif>> _getGifs() async {
    
  var url = Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=K0vdGdOxPi12JhZ40GOzRnCrxJhrzGMZ&limit=25&rating=g');
  var response = await http.get(url);
     List<Gif> gifs = [];

  String body = utf8.decode(response.bodyBytes);
  final jsonData = jsonDecode(body);
  for (var item in jsonData["data"]) {
    gifs.add(Gif(item["title"], item["images"]["downsized"]["url"]));
    
    }
    return gifs;

  }

  @override
  void initState() {
    super.initState();
    _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
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
              RecomendadeEventCard(
                image:"assets/imagens/fiesta.jpg" ,
                title: "Evento eletronica",
                date: "05/6/23",
                price: 5900,
                press: (){},

              ),
              RecomendadeEventCard(
                image:"assets/imagens/soccer.jpg" ,
                title: "Partido de futbol",
                date: "12/6/23",
                price: 5000,
                press: (){},

              ),
              RecomendadeEventCard(
                image:"assets/imagens/picina.jpg" ,
                title: "Fiesta en picina",
                date: "15/6/23",
                price: 10000,
                press: (){},

              ),
              RecomendadeEventCard(
                image:"assets/imagens/cicla.jpg" ,
                title: "Ciclismo",
                date: "14/4/23",
                price: 15000,
                press: (){},

              ),
              
              
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
    Key? key, required this.image,
     required this.title,
     required this.date,
     required this.price,
     required this.press,
  
  }) : super(key: key);

  final String image,title,date;
  final int price;
  final Function press;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding / 2, bottom: kDefaultPadding * 2.5),
      width: size.width * 0.5,
      child: Column(
        children: [
          Image.asset(image),
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
              child: Row(
                children: [
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$title\n", 
                        style: Theme.of(context).textTheme.button
                        ),
                      TextSpan(
                          text: "$date\n" ,
                          style: TextStyle(
                            color: Colors.red
                          ),
                        ),
          
                      TextSpan(
                      text: "\$$price" ,
                          style: TextStyle(
                            color: Colors.blue
                          ),
                        ),
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



