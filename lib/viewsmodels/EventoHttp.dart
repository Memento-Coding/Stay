import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:stay/models/user.dart';
import '../viewsmodels/messages/message.dart';

class SitioTuristicoHttp {
  Future<void> getEventos() async {
    final url = Uri.parse(
        'https://stay-back-production.up.railway.app/v1/sitio-turistico');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final data = jsonDecode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Los datos se enviaron correctamente');
    } else {
      print('Hubo un error al enviar los datos');
    }
  }


  /*
  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://stay-back-production.up.railway.app/v1/evento'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvX2lkIjoxOSwicm9sX2lkIjo0LCJub21icmUiOiJzb3llbEFkbWluIiwiY29ycmVvX2VsZWN0cm9uaWNvIjoic3VqZXRvYWRtaW5pc3RyYWRvckBnbWFpbC5jb20iLCJmb3RvIjoiaHR0cHM6Ly9yZXMuY2xvdWRpbmFyeS5jb20vZG1ieWl6emNkL2ltYWdlL3VwbG9hZC92MTY4MzYwMjc2My9qbDcyMTk1b2tzcHpuc2Zzc2RreC5qcGciLCJpYXQiOjE2ODM3NzYzNzIsImV4cCI6MTY4Mzc5Nzk3Mn0.lcOa4tIRYiHHV09yDjeJ8g__TpGkGrMBwsHHNe35Fqo',
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      /*
      setState(() {
        nombre = data;
      });
      print(response);
    } else {
      setState(() {
        responseData = 'Error al cargar los datos de la API';
      });
    }
    */
  }
  */
}
