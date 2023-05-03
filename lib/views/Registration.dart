import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stay/models/user.dart';
import 'package:stay/widgets/password-input..dart';
import 'package:stay/widgets/rounded-botton.dart';
import '../widgets/text-field.dart';

import '../widgets/background_image.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _inputUser = TextEditingController();
    const TextStyle kBodyText =
        TextStyle(fontSize: 22, color: Colors.white, height: 1.5);
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/Register.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]!.withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.white,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: const Color(0xff5663ff),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.arrowUp,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    //Campo user
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500]!.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: _inputUser,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Icon(
                                  FontAwesomeIcons.user,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: 'User',
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ),

                    /*
                    TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'User',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      controllerField: _inputUser,
                    ),
                    */
                    const TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    const PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.next,
                    ),
                    const PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Confirm Password',
                      inputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    RoundedButton(
                        buttonName: 'Register',
                        user: User(
                            name: _inputUser.text,
                            email: "gngn",
                            password: "gfgf",
                            confirmPassword: "gffgf")),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            print(_inputUser.text);
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: const Color(0xff5663ff),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
