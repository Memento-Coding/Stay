import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:stay/models/SitioTuristico.dart';
import 'package:stay/viewsmodels/SitioTuristico.dart';
//import 'package:stay/components/header_with_search.dart';

import '../const.dart';

class Body extends StatefulWidget {
  const Body({super.key});
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  SitioTuristicoHttp sitioTuristicoHttp = SitioTuristicoHttp();
  List<SitioTuristico> listaSitios = [];

  String titulo = '';
  String descripcion = '';
  String fecha = '';
  String responseData = '';
  List<dynamic> nombre = [];
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    //fetchData();
    getSitiosTuristicos();
    
  }

  Future<void> getSitiosTuristicos() async {
    List<SitioTuristico> lista = [];
    final url = Uri.parse(
        'https://stay-back-production.up.railway.app/v1/sitio-turistico');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final data = jsonDecode(response.body);
    for (int i = 0; i < data.length; i++) {
      lista.add(SitioTuristico(
          sitioTuristicoId: data[i]["sitio_turistico_id"],
          nombre: data[i]["nombre"],
          descripcion: data[i]["descripcion"],
          ubicacion: data[i]["ubicacion"],
          foto: data[i]["foto"]));
    }
    setState(() {
      listaSitios = [...lista];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 300.0,
              padding: const EdgeInsets.symmetric(vertical: 60),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fondo-brujula.jpg'),
                      fit: BoxFit.cover)),
            ),
            //HeaderWithSearchBox(size: MediaQuery.of(context).size),
          ],
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listaSitios.length,
                itemBuilder: (context, index) {
                  final sitio = listaSitios[index];
                  return RecomendadeEventCard(
                    id: sitio.sitioTuristicoId,
                    title: sitio.nombre,
                    description: sitio.descripcion,
                    date: sitio.ubicacion,
                    image: sitio.foto,
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RecomendadeEventCard extends StatelessWidget {
  const RecomendadeEventCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.image})
      : super(key: key);

  final String title, date, description, image;
  final int id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding * 2.5),
      width: size.width * 0.5,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              //SitioTuristico sitioTuristico = SitioTuristico(sitioTuristicoId: 1, nombre: title, descripcion: description, ubicacion: date, foto: "");
              Navigator.pushNamed(context, '/place',
                  arguments: SitioTuristico(
                      sitioTuristicoId: id,
                      nombre: title,
                      descripcion: description,
                      ubicacion: date,
                      foto: image));
            },
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
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
                            image: DecorationImage(
                              image: NetworkImage(
                                image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                description,
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
