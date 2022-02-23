import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stitch/state/bridge_state/bridge_state.dart';
import 'package:stitch/state/route_state/route_state.dart';

/// A list of all the provider classes used across the application scope.
final List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<RouteWatcher>(create: (context) => RouteWatcher()),
  ChangeNotifierProvider<BridgeBase>(create: (context) => BridgeBase()),
];
