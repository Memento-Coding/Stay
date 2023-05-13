import 'dart:convert';

class User {
    String? imagen;
    String correoElectronico;
    String nombreUsuario;
    String? password;
    int rolId;
    int? id;

    User({
        this.imagen,
        this.id,
        this.password,
        required this.correoElectronico,
        required this.nombreUsuario,
        required this.rolId,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['usuario_id'],
        rolId: json["rol_id"],
        nombreUsuario: json["nombre"],
        correoElectronico: json["correo_electronico"],
        imagen: json["foto"],     
    );

    Map<String, dynamic> toJson() => {
        "imagen": imagen,
        "correo_electronico": correoElectronico,
        "nombre_usuario": nombreUsuario,
        "rol_id": rolId,
        "contrasenia":password
    };
}
