import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stay/models/SitioTuristico.dart';

class SitioTuristicoHttp {
  Future<List<SitioTuristico>> getSitiosTuristicos() async {
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
      lista.add(SitioTuristico(sitioTuristicoId: data[i]["sitio_turistico_id"], nombre: data[i]["nombre"], descripcion: data[i]["descripcion"], ubicacion: data[i]["ubicacion"], foto: data[i]["foto"]));
    }
    return lista;
  }
}