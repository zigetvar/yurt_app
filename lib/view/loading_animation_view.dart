import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yurt_app/component/background_color_gradient.dart';
import 'package:yurt_app/view/home_view.dart';

class LoadingAnimationView extends StatefulWidget {
  const LoadingAnimationView({Key? key}) : super(key: key);

  @override
  State<LoadingAnimationView> createState() => _LoadingAnimationViewState();
}

class _LoadingAnimationViewState extends State<LoadingAnimationView> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: background_color_gradient(),
          ),
          child: Center(
      child: LoadingAnimationWidget.inkDrop(
          color: Color.fromARGB(255, 195, 85, 215),
          size: 200,
      ),
    ),
        ));
  }
}
