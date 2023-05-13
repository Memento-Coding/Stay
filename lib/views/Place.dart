import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stay/helpers/JwtService.dart';
import 'package:stay/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stay/models/Comentario.dart';
import 'package:stay/viewsmodels/Comentario.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:stay/models/SitioTuristico.dart';

class Place extends StatefulWidget {
  const Place({super.key});

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  ComentarioHttp comentarioHttp = ComentarioHttp();
  List<Comentario> ListaComentarios = [];

  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    getComentario();
  }

  Future<void> getComentario() async {
    List<Comentario> lista = [];
    final url =
        Uri.parse('https://stay-back-production.up.railway.app/v1/comentario');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final data = jsonDecode(response.body);
    for (int i = 0; i < data.length; i++) {
      lista.add(Comentario(
          comentarioId: data[i]["comentario_id"],
          descripcion: data[i]["descripcion"],
          fechaPublicacion: data[i]["fecha_publicacion"],
          sitioId: data[i]["sitio_id"],
          userId: data[i]["user_id"]));
    }
    setState(() {
      ListaComentarios = [...lista];
    });
  }

  @override
  Widget build(BuildContext context) {
    final argumento =
        ModalRoute.of(context)?.settings.arguments as SitioTuristico;
    List<String> images = [argumento.foto];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
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
                                child: Text(argumento.nombre,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Center(
                                child: Text(argumento.descripcion,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )),
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
                                    itemBuilder: (context, _) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      );
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
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        filled: true,
                                        fillColor: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ))),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: ListaComentarios.length,
                          itemBuilder: (context, index) {
                            final comentario = ListaComentarios[index];
                            print(comentario);
                            return RecomendadeEventCard(
                              id: comentario.comentarioId,
                              description: comentario.descripcion,
                              date: comentario.fechaPublicacion,
                              place: comentario.sitioId,
                              user: comentario.userId,
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecomendadeEventCard extends StatelessWidget {
  const RecomendadeEventCard(
      {Key? key,
      required this.id,
      required this.description,
      required this.date,
      required this.place,
      required this.user})
      : super(key: key);

  final String date, description;
  final int id, place, user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 2, top: 2, bottom: 2.5),
      width: size.width * 0.5,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                description,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                date,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                user.toString(),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
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

/*class Place extends StatefulWidget {
  Place({Key? key}) : super(key: key);

  

  

  @override
  Widget build(BuildContext context) {
    final argumento =
        ModalRoute.of(context)?.settings.arguments as SitioTuristico;
    List<String> images = [argumento.foto];
    return 
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}*/
