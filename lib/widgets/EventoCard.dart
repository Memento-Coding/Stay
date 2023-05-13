import 'package:flutter/material.dart';
import 'package:stay/models/Evento.dart';
import '../const.dart';

class EventoCard extends StatelessWidget {
  const EventoCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.date,
      required this.id})
      : super(key: key);

  final String title, date, description;
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
              Navigator.pushNamed(context, '/place',
                  arguments: Evento(
                    id: id,
                    nombre: title,
                    descripcion: description,
                    fechaHora: date,
                  ));
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
                              const SizedBox(height: 5.0),
                              Text(
                                "Fecha: ${date.split('T')[0]} Hora: ${date.split('T')[1].split('.')[0]}",
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



