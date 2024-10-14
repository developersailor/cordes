import 'package:cordes/core/viewmodels/login_view_model.dart';
import 'package:cordes/ui/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './widgets/login_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (BuildContext context, LoginModel model, Widget? child) =>
          Scaffold(
        backgroundColor: const Color.fromRGBO(50, 50, 50, 1),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage(
                        'https://live.staticflickr.com/65535/51250632632_1b8c793d43_o_d.jpg'),
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: TextField(
                    controller: _email,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'E-mail',
                      fillColor: Colors.white,
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(98, 0, 238, 1), width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: TextField(
                    controller: _password,
                    enableSuggestions: false,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'Şifre',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(98, 0, 238, 1), width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                LoginButton(
                  buttonIcon: const FaIcon(FontAwesomeIcons.signInAlt),
                  onPressed: () async =>
                      await model.registerInEmail(_email.text, _password.text),
                  buttonText: 'Kayıt ol',
                  buttonColor: const Color.fromRGBO(98, 0, 238, 1),
                  textColor: Colors.white,
                ),
                //       Container(
                //         child: InkWell(
                //           onTap: () {},
                //           child: Text(
                //             'Şifremi Unuttum',
                //             style: TextStyle(
                //                 color: Colors.white,
                //                 decoration: TextDecoration.underline),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 15.0,
                ),
                LoginButton(
                  buttonIcon: const FaIcon(FontAwesomeIcons.mailBulk),
                  onPressed: () async {
                    final loginSuccess = await model.signInEmailAndPassword(
                        _email.text, _password.text);
                    if (loginSuccess) {
                      await Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                  buttonText: 'Giriş Yap',
                  buttonColor: const Color.fromRGBO(98, 0, 238, 1),
                  textColor: Colors.white,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                LoginButton(
                  buttonIcon: const FaIcon(FontAwesomeIcons.google),
                  onPressed: () async {
                    final loginSuccess = await model.signInWithGoogle();
                    if (loginSuccess) {
                      await Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                  buttonColor: const Color.fromRGBO(98, 0, 238, 1),
                  textColor: Colors.white,
                  buttonText: 'Google ile Giriş',
                ),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
