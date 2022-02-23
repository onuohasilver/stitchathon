import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stitch/state/bridge_state/bridge_state.dart';

BridgeBase bridge(BuildContext context) =>
    Provider.of<BridgeBase>(context, listen: false);
