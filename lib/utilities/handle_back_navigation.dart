import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stitch/state/route_state/route_state.dart';

/// Onwillpopscope method trigger
Future<bool> handleBackNavigation(BuildContext context) async {
  RouteWatcher routeWatcher = Provider.of<RouteWatcher>(context, listen: false);

  // if (bridge(context).read(Naming.modalIsActive, false).slice as bool) {
  //   Navigator.pop(context);
  // }
  // bridge(context).load(Naming.modalIsActive, false, bool);
  routeWatcher.previousScreen();

  return false;
}
