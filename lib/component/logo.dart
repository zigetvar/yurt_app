import 'package:flutter/material.dart';

class LogoView extends StatelessWidget {
  const LogoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Container(
          width: 150,
          height: 155,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color.fromARGB(255, 13, 53, 175),
                Color.fromARGB(255, 18, 17, 102),
                Color.fromARGB(255, 67, 70, 164),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage("assets/image/logo.png"),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
