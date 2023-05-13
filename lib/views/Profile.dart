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
    _jwtService.setToken('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvX2lkIjoxOSwicm9sX2lkIjo0LCJub21icmUiOiJzb3llbEFkbWluIiwiY29ycmVvX2VsZWN0cm9uaWNvIjoic3VqZXRvYWRtaW5pc3RyYWRvckBnbWFpbC5jb20iLCJmb3RvIjoiaHR0cHM6Ly9yZXMuY2xvdWRpbmFyeS5jb20vZG1ieWl6emNkL2ltYWdlL3VwbG9hZC92MTY4Mzk0ODkyOS9yaDNsanlzeHdheTRtdnpnbGJwei5qcGciLCJpYXQiOjE2ODM5ODQxNDQsImV4cCI6MTY4NDAwNTc0NH0.odzwtq6ZJCsWh8oyRbIvOBzQEk6TkvxcyxmhCdPSyLk');
    Map<String, dynamic> payloadMap = _jwtService.getPayload();
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
