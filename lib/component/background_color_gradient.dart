import 'package:flutter/material.dart';

LinearGradient background_color_gradient() {
    return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color.fromARGB(255, 2, 53, 206),
            Color.fromARGB(255, 18, 17, 102),
            Color.fromARGB(255, 67, 70, 164),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        );
  }