import 'package:flutter/cupertino.dart';
import 'package:stitch/state/bridge_state/bridge_errors.dart';
import 'package:stitch/state/bridge_state/bridge_model.dart';

class BridgeBase extends ChangeNotifier {
  final Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  ///Close the Bridge Instance AppWide
  ///This simply clears the bridge
  void close() {
    _data.clear();
    notifyListeners();
  }

  /// Closes the data Access to a parsed Key value
  void closeKey(String name) {
    _data.remove(name);
    notifyListeners();
  }

  ///Loads a parsed name slice pair into the memory
  void load(String name, dynamic slice, Type type,
      [bool override = true, bool exception = false]) {
    if (override) {
      if (_data.containsKey(name) && (type is Map)) {
        _data[name]['slice'].addAll(slice as Map);
      } else {
        _data[name] = {'slice': slice, 'type': type};
      }
    } else {
      if (exception) throw (BridgeErrors.cannotOverride);
    }

    notifyListeners();
  }

  bool containsKey(String key) {
    return _data.containsKey(key);
  }

  ///Retrieves a previously saved bridge slice
  BridgeModel read(String name, dynamic initial) {
    if (_data.containsKey(name)) {
      return BridgeModel(_data[name]['slice'], _data[name]['type']);
    } else {
      return BridgeModel(initial, initial.runtimeType);
    }
  }
}
