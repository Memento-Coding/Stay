import 'dart:convert';

class Comentario {
  int comentarioId;
  String descripcion;
  String fechaPublicacion;
  int userId;
  int sitioId;

  Comentario(
      {required this.comentarioId,
      required this.descripcion,
      required this.fechaPublicacion,
      required this.sitioId,
      required this.userId});

  factory Comentario.fromRawJson(String str) =>
      Comentario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comentario.fromJson(Map<String, dynamic> json) => Comentario(
      comentarioId: json["comentario_id"],
      descripcion: json["descripcion"],
      fechaPublicacion: json["fecha_publicacion"],
      sitioId: json["sitio_id"],
      userId: json["user_id"]);

  Map<String, dynamic> toJson() => {
    "comentario_id": comentarioId,
    "descripcion": descripcion,
    "fecha_publicacion": fechaPublicacion,
    "sitio_id": sitioId,
    "user_id": userId

  };

}
