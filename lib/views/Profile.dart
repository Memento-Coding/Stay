import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stay/helpers/JwtService.dart';
import 'package:stay/models/user.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final JwtService _jwtService = JwtService.getInstance();
  String _payload = '';
  User? user;

  @override
  void initState() {
    super.initState();
    // Obtener la información del payload cuando se carga la pantalla
    _jwtService.setToken('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZW4iOiJodHRwczovL2ltYWdlcy51bnNwbGFzaC5jb20vcGhvdG8tMTUzNTcxMzg3NTAwMi1kMWQwY2YzNzdmZGU_aXhsaWI9cmItNC4wLjMmaXhpZD1Nbnd4TWpBM2ZEQjhNSHh3YUc5MGJ5MXdZV2RsZkh4OGZHVnVmREI4Zkh4OCZhdXRvPWZvcm1hdCZmaXQ9Y3JvcCZ3PTIwODAmcT04MCIsImNvcnJlb19lbGVjdHJvbmljbyI6Imhyb3NlbmtyYW50ejBAcGF0Y2guY29tIiwibm9tYnJlX3VzdWFyaW8iOiJrZmFsZG8wIiwicm9sX2lkIjoxfQ.Fk_B0r2JgBrzH0tp-xiXCXoI4vhFAlegLTWXAPaBY3I');
    //&Map<String, dynamic> payloadMap = _jwtService.getPayload();
    setState(() {
      user = _jwtService.getUser();
    });
    print(user?.correoElectronico);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(100),
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/images/Hoyos.jpg')),
            ),
            const SizedBox(height: 10),
            Text(
              user?.nombreUsuario ?? 'User',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              user?.correoElectronico ?? 'email',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/update');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text("Editar",
                      style: TextStyle(color: Colors.black)),
                )
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            //Menu Opciones
            ProfileMenuWidget(
              title: "Information",
              icon: LineAwesomeIcons.info,
              onPress: (){},
            ),
            const Divider(),
            const SizedBox(height: 10),
            ProfileMenuWidget(
              title: "Salir",
              icon: LineAwesomeIcons.alternate_sign_out,
              endIcon: false,
              onPress: () {
                Navigator.popAndPushNamed(context, "/login");
              },
            ),
          ],
        ),
      ),
    ));
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPress,
      this.endIcon = true,
      this.textColor});

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Icon(icon, color: Colors.purple),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.grey),
            )
          : null,
    );
  }
}
