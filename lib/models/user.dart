import 'dart:convert';

class User {
    String? imagen;
    String correoElectronico;
    String nombreUsuario;
    String password;
    int rolId;

    User({
        this.imagen,
        required this.password,
        required this.correoElectronico,
        required this.nombreUsuario,
        required this.rolId,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        imagen: json["imagen"],
        correoElectronico: json["correo_electronico"],
        nombreUsuario: json["nombre_usuario"],
        rolId: json["rol_id"],
        password: json["contrasenia"]
    );

    Map<String, dynamic> toJson() => {
        "imagen": imagen,
        "correo_electronico": correoElectronico,
        "nombre_usuario": nombreUsuario,
        "rol_id": rolId,
        "contrasenia":password
    };
}
