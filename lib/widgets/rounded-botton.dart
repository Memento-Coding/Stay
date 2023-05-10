import 'package:flutter/material.dart';
import 'package:stay/models/user.dart';


class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonName,
    required this.user,
  }) : super(key: key);

  final String buttonName;
  final User user;

  @override
  Widget build(BuildContext context) {
    const TextStyle kBodyText =
    TextStyle(fontSize: 22, color: Colors.white, height: 1.5);
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xff5663ff),
      ),
      child: TextButton(
        onPressed: () {
          //user.imprimir();
        },
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}