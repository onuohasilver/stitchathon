import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Fader extends StatelessWidget {
  final Widget child;
  const Fader({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: child,
      duration: Duration(milliseconds: Random().nextInt(1000)),
    );
  }
}
