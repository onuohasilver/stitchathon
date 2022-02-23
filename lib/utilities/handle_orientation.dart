import 'package:flutter/services.dart';

///Set the screen to always be on portrait
void handleOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
