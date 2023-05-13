import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stay/models/Comentario.dart';

class ComentarioHttp {
  Future<List<Comentario>> getComentario() async {
    List<Comentario> lista = [];
    final url = Uri.parse(
        'https://stay-back-production.up.railway.app/v1/comentario');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final data = jsonDecode(response.body);
    for (int i = 0; i < data.length; i++) {
      lista.add(Comentario(
        comentarioId: 
        data[i]["comentario_id"], 
        descripcion: data[i]["descripcion"], 
        fechaPublicacion: data[i]["fecha_publicacion"], 
        sitioId: data[i]["sitio_id"], 
        userId: data[i]["user_id"]));
    }
    return lista;
  }
}