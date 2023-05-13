import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stay/helpers/JwtService.dart';
import 'package:stay/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stay/viewsmodels/UserHttp.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final JwtService _jwtService = JwtService.getInstance();
  final storage = const FlutterSecureStorage();
  User? user;

  @override
  void initState() {
    super.initState();
    getTokenAndData();
  }

  void getTokenAndData() async {
    String token = await storage.read(key: 'jwt') ?? '';
    print(token);
    _jwtService.setToken(token);
    Map<String, dynamic> payloadMap = _jwtService.getPayload();
    setState(() {
      user = _jwtService.getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(user?.imagen);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(100),
        child: Column(
          children: [
            SizedBox(
              width: 150,
              height: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(user?.imagen ?? "assets/images/logoOficial.jpg")),
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
                )),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            ProfileMenuWidget(
              title: "Salir",
              icon: LineAwesomeIcons.alternate_sign_out,
              endIcon: false,
              onPress: () {
                UserHttp userHttp = UserHttp();
                userHttp.salir(user!);
                Navigator.popAndPushNamed(context, "/login");
              },
            ),
            const Divider(),
            const SizedBox(height: 10),
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
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Icon(icon, color: Colors.red),
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
