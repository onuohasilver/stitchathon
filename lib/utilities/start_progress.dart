import 'package:stitch/state/bridge_state/bridge_state.dart';
import 'package:stitch/utilities/global_naming.dart';

void startProgress(BridgeBase bridge, bool state) {
  bridge.load(Naming.isInProgress, state, bool);
}
