import 'package:flutter/material.dart';
import 'package:flutter_form_validation/design/canes_color.dart';
import 'package:flutter_form_validation/design/canes_text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static final routeName = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CanesColor.colorBrand,
      body: Container(
        alignment: Alignment.center,
        color: CanesColor.darkGrey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(FontAwesomeIcons.at),
                      hintText: 'ejemplo@correo.com',
                      labelText: 'Correo Electrónico',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      focusColor: CanesColor.error,
                      hoverColor: CanesColor.error,
                      fillColor: CanesColor.error,
                      labelText: 'Contraseña',
                      icon: Icon(FontAwesomeIcons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(FontAwesomeIcons.eye),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  TextButton(
                    onPressed: () {
                      print('Recuperar Password');
                    },
                    child: isLogin
                        ? Text(
                            'Recupera tu Password',
                            style: CanesTextStyle.buttonLabelM,
                          )
                        : Container(),
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(CanesColor.colorBrand),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        isLogin ? 'Login' : 'Registrate',
                        textAlign: TextAlign.center,
                        style: CanesTextStyle.buttonLabelL,
                      ),
                    ),
                    onPressed: () {
                      //TODO: https://www.youtube.com/watch?v=gl6wpsgiNfY
                      isLogin ? print('Login') : print('Registro');
                      if (isLogin)
                        Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: Text(
                        isLogin
                            ? 'No tienes cuenta? Registrate'
                            : 'Ya tienes cuenta? Logueate',
                        style: CanesTextStyle.buttonLabelM,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
