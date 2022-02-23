import 'package:flutter/material.dart';

class AppDecorations {
  static final fadedBlueContainer = BoxDecoration(
    color: const Color(0xFFCCE4FF).withOpacity(.6),
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      color: const Color(0xFFCCE4FF),
    ),
  );
}
