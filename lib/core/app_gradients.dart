import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_colors.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color(0xFF212121),
    Color.fromRGBO(0, 0, 0, 0.695),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}
