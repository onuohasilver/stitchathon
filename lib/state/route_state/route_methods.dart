import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stitch/state/route_state/route_state.dart';

RouteWatcher route(BuildContext context) =>
    Provider.of<RouteWatcher>(context, listen: false);
