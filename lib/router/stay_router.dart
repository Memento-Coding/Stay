
import 'package:flutter/material.dart';
import 'package:stay/models/menu_ruta.dart';
import 'package:stay/views/Home.dart';
import 'package:stay/views/login.dart';
import 'package:stay/views/register.dart';

class AppRoutes {
  static const initialRoute = '/home';
  final int index;
  const AppRoutes({required this.index});

  static final rutas = <MenuRuta>[
    //Aqui van las otras pantallas
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      "/home": (BuildContext context) => HomeScreen(),
      "/login": (BuildContext context) => StayLogin(),
      //"/detalle": (BuildContext context) => const DetalleScreen(),
      //"/login": (BuildContext context) => const LoginScreen(),
      "/register": (BuildContext context) => const RegisterPage(),
    });
    for (final ruta in rutas) {
      appRoutes.addAll({
        ruta.route: (BuildContext context) => ruta.screen,
      });
    }
    return appRoutes;
  }

  /*
  Widget miPages() {
    List<Widget> pages = [
      const PrincipalScreen(),
      const ProfileScreen(),
    ];
    return pages[index];
  }
  */
}
