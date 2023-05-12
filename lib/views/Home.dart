import 'package:flutter/material.dart';
import 'package:stay/helpers/JwtService.dart';
import 'package:stay/widgets/body.dart';



class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final JwtService _jwtService = JwtService.getInstance();
 
  @override
  Widget build(BuildContext context) {
    //_jwtService.setToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZW4iOiJodHRwczovL2ltYWdlcy51bnNwbGFzaC5jb20vcGhvdG8tMTUzNTcxMzg3NTAwMi1kMWQwY2YzNzdmZGU_aXhsaWI9cmItNC4wLjMmaXhpZD1Nbnd4TWpBM2ZEQjhNSHh3YUc5MGJ5MXdZV2RsZkh4OGZHVnVmREI4Zkh4OCZhdXRvPWZvcm1hdCZmaXQ9Y3JvcCZ3PTIwODAmcT04MCIsImNvcnJlb19lbGVjdHJvbmljbyI6Imhyb3NlbmtyYW50ejBAcGF0Y2guY29tIiwibm9tYnJlX3VzdWFyaW8iOiJrZmFsZG8wIiwicm9sX2lkIjoxfQ.Fk_B0r2JgBrzH0tp-xiXCXoI4vhFAlegLTWXAPaBY3I");
    //print("Estoy desde Home${_jwtService.getUser().nombreUsuario}");
    return const Scaffold(
      body: Body(),
    );
  }
}