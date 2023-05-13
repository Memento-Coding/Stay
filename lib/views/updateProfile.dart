import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stay/views/HomeBar.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () {Navigator.pushNamed(context, "/HomeBar");}, icon: const Icon(LineAwesomeIcons.angle_left),color: Colors.black,),
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(100),
            child: Column(children: [
              Stack(
                children: [
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset('assets/images/Hoyos.jpg'))
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.amber),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Form(child: Column(
                children: [
                  TextFormField(
                    initialValue: "kfaldo0",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      prefixIconColor: Colors.black,
                      floatingLabelStyle: const TextStyle(color: Colors.deepPurple),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.grey
                        )
                      ),
                      label: const Text("Username"),
                      prefixIcon: const Icon(LineAwesomeIcons.user)
                    ),
                    onChanged: (value){
                      setState(() {
                        _name = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    initialValue: "hrosenkrantz0@patch.com",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      prefixIconColor: Colors.black,
                      floatingLabelStyle: const TextStyle(color: Colors.deepPurple),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.grey
                        )
                      ),
                      label: const Text("E-mail"),
                      prefixIcon: const Icon(LineAwesomeIcons.envelope_1)
                    ),
                    onChanged: (value)=>{
                      setState(() {
                        _email = value;
                      })
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    initialValue: "BTm4tlW6abDW",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      prefixIconColor: Colors.black,
                      floatingLabelStyle: const TextStyle(color: Colors.deepPurple),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.grey
                        )
                      ),
                      label: const Text("Password"),
                      prefixIcon: const Icon(LineAwesomeIcons.lock)
                    ),
                    onChanged: (value)=>{
                      setState(() {
                        _password = value;
                      })
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,side: BorderSide.none,shape: const StadiumBorder(),
                      ),
                      onPressed:() {
                        print('Nombre $_name');
                        print('Email $_email');
                        print('Password $_password');
                      }, child: const Text("Editar",style: TextStyle(color: Colors.black))
                    ),
                  ),
                  const SizedBox(height: 30)
                ],
              ))
            ]),
          ),
        ),
        //bottomNavigationBar: const HomeBar()
      );
  }
}
