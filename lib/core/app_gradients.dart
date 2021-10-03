import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_colors.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color(0xFF212121),
    Color.fromRGBO(0, 0, 0, 0.795),
  ], stops: [
    0.0,
    0.795
  ], transform: GradientRotation(2.13959913 * pi));

  // static final bottomTop = LinearGradient(
  //     begin: Alignment.topCenter,
  //     end: Alignment.bottomCenter,
  //     colors: [                
  //       Color(0x48000000),
  //       Color(0x48000000),
  //       Color(0x48000000),
  //       Color(0x48000000),
  //     ], 
  //     stops: [
  //       0.3,
  //       0.5, 
  //       0.3,
  //       1
  //     ],
  //   );
}
