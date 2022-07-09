import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yurt_app/component/logo.dart';
import 'package:get/get.dart';
import 'package:yurt_app/view/loading_animation_view.dart';

import '../component/background_color_gradient.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: background_color_gradient(),
        ),
        child: ListView(
          children: [Column(
            children: [
              LogoView(),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "HOŞGELDİNİZ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                width: 300,
                child: Text(
                  "Lütfen giriş yapmak için size verilmiş kullanıcı adı ve şifreyi kullanınız",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    user_name_textField(),
                    password_textField(),
                    button_textField(),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Giriş yapmakta zorlanıyorsanız lütfen ",
                          style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 189, 184, 184)),
                          children: [
                            TextSpan(
                              style: TextStyle(color: Colors.white),
                              text: "Tıklayınız",
                              
                              recognizer:TapGestureRecognizer()..onTap=() => print("object") ,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),]
        ),
      ),
    );
  }

  

  Widget button_textField() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        width: 325,
        height: 65,
        child: ElevatedButton(
          onPressed: () {Get.to(LoadingAnimationView());},
          child: Text("Giriş"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 195, 85, 215)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget password_textField() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: 325,
        child: TextField(
          obscureText: _isObscure,
          style: TextStyle(color: Colors.white, fontSize: 18),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 21, horizontal: 30),
            labelText: "Şifre",
            labelStyle: TextStyle(fontSize: 17, color: Colors.white),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                borderSide: BorderSide(width: 1.5, color: Colors.white)),
            filled: true,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              icon: Icon(
                _isObscure ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox user_name_textField() {
    return SizedBox(
      width: 325,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: TextField(
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 21, horizontal: 30),
            labelText: "Kullanıcı adı",
            labelStyle: TextStyle(fontSize: 17, color: Colors.white),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                borderSide: BorderSide(width: 1.5, color: Colors.white)),
            filled: true,
          ),
        ),
      ),
    );
  }
}
