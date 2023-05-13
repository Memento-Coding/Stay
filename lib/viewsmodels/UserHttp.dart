import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:stay/models/user.dart';
import '../viewsmodels/messages/message.dart';

class UserHttp {
  Future<void> iniciarSesion(BuildContext context, FlutterSecureStorage storage,
      String email, String password) async {
    Message msge = Message();
    if (email == '' && password == '') {
      msge.mostrarMensaje(context, 'Oops!', "Por favor ingresa los datos 😢");
      return;
    }

    final url =
        Uri.parse('https://stay-back-production.up.railway.app/v1/login');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'correo_electronico': email,
        'contrasenia': password,
      }),
    );

    Map<String, dynamic> map =
        Map<String, dynamic>.from(jsonDecode(response.body));
    final token = map["token"];
    if (response.statusCode == 200) {
      await storage.write(key: 'jwt', value: token ?? " ");
      Navigator.of(context).popAndPushNamed("/HomeBar");
    } else if (response.statusCode == 401) {
      msge.mostrarMensaje(context, "Inicio de sesión fallido",
          "El email o la contraseña son incorrectos.");
    } else if (response.statusCode == 500) {
      msge.mostrarMensaje(context, 'Oops!', "Vuelve a intentarlo 😢");
    }

    if (response.statusCode == 200) {
      print('Los datos se enviaron correctamente');
    } else {
      print('Hubo un error al enviar los datos');
    }
  }

  Future<void> registrarse(BuildContext context, User user) async {
    Message msge = Message();
    final url =
        Uri.parse('https://stay-back-production.up.railway.app/v1/user');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{
            'correo_electronico': user.correoElectronico,
            'contrasenia': user.password,
            "nombre_usuario": user.nombreUsuario,
            "rol_id": 1
          },
        ));
    final data = jsonDecode(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      msge.mostrarMensaje(
          context, "Registro Exitoso", "Es hora de disfrutar Stay 😁😎");
      Navigator.of(context).popAndPushNamed("/login");
    }

    if (response.statusCode == 200) {
      print('Los datos se enviaron correctamente');
    } else {
      print('Hubo un error al enviar los datos');
    }
  }

  Future<void> salir(User user) async {
    final storage = const FlutterSecureStorage();
    storage.delete(key: 'jwt');
  }

  Future<void> actualizar(BuildContext context, int id, User user,
      String password, String token) async {
    Message msge = Message();
    final url =
        Uri.parse('https://stay-back-production.up.railway.app/v1/user/$id');
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        "correo_electronico": user.correoElectronico,
        "contrasenia": user.password ?? password,
        "nombre_usuario": user.nombreUsuario,
      }),
    );
    if (response.statusCode == 200) {
      msge.mostrarMensaje(context, "Actualización Exitosa", "Tus Datos han sido actualizados.");
      Navigator.popAndPushNamed(context, "/HomeBar");
    } else {
      msge.mostrarMensaje(context, 'Oops!', "Vuelve a intentarlo 😢");
    }
    if (response.statusCode == 200) {
      print('Los datos se enviaron correctamente');
    } else {
      print('Hubo un error al enviar los datos');
    }
  }
}
