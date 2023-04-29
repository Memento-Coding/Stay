
import 'package:flutter/material.dart';
import 'package:stay/models/menu_ruta.dart';
import 'package:stay/views/Menu.dart';
import 'package:stay/views/Registration.dart';
import 'package:stay/views/Welcome.dart';
import 'package:stay/views/login.dart';

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
      "/welcome": (BuildContext context) => WelcomeScreen(),
      "/login": (BuildContext context) => const StayLogin(),
      "/register":(BuildContext context) => const RegisterScreen(),
      "/menu":(BuildContext context) => const Menu(),
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

    ];
    return pages[index];
  }
}
