// To parse this JSON data, do
//
//     final sitioTuristico = sitioTuristicoFromJson(jsonString);

import 'dart:convert';

class SitioTuristico {
    int sitioTuristicoId;
    String nombre;
    String descripcion;
    String ubicacion;
    String foto;

    SitioTuristico({
        required this.sitioTuristicoId,
        required this.nombre,
        required this.descripcion,
        required this.ubicacion,
        required this.foto,
    });

    factory SitioTuristico.fromRawJson(String str) => SitioTuristico.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SitioTuristico.fromJson(Map<String, dynamic> json) => SitioTuristico(
        sitioTuristicoId: json["sitio_turistico_id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        ubicacion: json["ubicacion"],
        foto: json["foto"],
    );

    Map<String, dynamic> toJson() => {
        "sitio_turistico_id": sitioTuristicoId,
        "nombre": nombre,
        "descripcion": descripcion,
        "ubicacion": ubicacion,
        "foto": foto,
    };
}