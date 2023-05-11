import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stay/helpers/JwtService.dart';
import 'package:stay/models/user.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(Place());
}

class Place extends StatelessWidget {
  Place({Key? key}) : super(key: key);

  List<String> images = ["https://via.placeholder.com/350x150"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300.0,
            padding: const EdgeInsets.symmetric(vertical: 60),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fondo-brujula.jpg'),
                    fit: BoxFit.cover)),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: images.length,
              viewportFraction: 0.8,
              scale: 0.8,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      color: Colors.white,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Center(
                                child: Text('Titulo', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,)),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Center(
                                child: Text('"El Picacho" también podría albergar algún tipo de atracción o punto de referencia, como una estatua, una cruz, una capilla u otro elemento distintivo en su cima o cerca de ella.', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Container(
                                      child: RatingBar.builder(
                                        itemCount: 5,
                                        initialRating: 3,
                                        itemSize: 40,
                                        allowHalfRating: true,
                                        itemBuilder: (context,_) {
                                          return Icon(Icons.star, color: Colors.amber,);
                                        },
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Container(
                                  child: ElevatedButton(
                                    onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))), 
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          "¿Como llegar?",
                                          style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0),
                                ),
                              ],
                            )),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: Container(
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: "Agregar Comentario",
                                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)), 
                                      filled: true, 
                                      fillColor: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
