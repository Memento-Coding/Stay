import 'package:flutter/material.dart';
import 'package:stay/models/menu_ruta.dart';
import 'package:stay/views/Home.dart';
import 'package:stay/views/HomeBar.dart';
import 'package:stay/views/Place.dart';
import 'package:stay/views/Profile.dart';
import 'package:stay/views/Welcome.dart';
import 'package:stay/views/updateProfile.dart';
import 'package:stay/views/login.dart';
import 'package:stay/views/register.dart';

class AppRoutes {
  static const initialRoute = '/welcome';
  final int index;
  const AppRoutes({required this.index});

  static final rutas = <MenuRuta>[
    //Aqui van las otras pantallas
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      "/welcome": (BuildContext context) => const WelcomeScreen(),
      "/HomeBar": (BuildContext context) => const HomeBar(),
      "/update": (BuildContext context) => const UpdateProfile(),
      "/login": (BuildContext context) => const Inicio(),
      "/register": (BuildContext context) => const Register(),
      "/place": (BuildContext context) => Place(),
    });
    for (final ruta in rutas) {
      appRoutes.addAll({
        ruta.route: (BuildContext context) => ruta.screen,
      });
    }
    return appRoutes;
  }

  Widget miPages() {
    List<Widget> pages = [
      Home(),
      const Profile(),
    ];
    return pages[index];
  }
}
