import 'package:flutter/material.dart';
import 'package:stay/router/stay_router.dart';

void main() =>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
   Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Stay',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getRoutes(),
    );
   }
  
}