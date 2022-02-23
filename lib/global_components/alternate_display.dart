import 'package:flutter/material.dart';

class AlternateDisplay extends StatelessWidget {
  const AlternateDisplay({
    Key? key,
    required this.initialChild,
    required this.finalChild,
    required this.control,
  }) : super(key: key);
  final Widget initialChild, finalChild;
  final bool control;
  @override
  Widget build(BuildContext context) {
    return Container(child: control ? finalChild : initialChild);
  }
}
