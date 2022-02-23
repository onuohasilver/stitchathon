import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stitch/state/bridge_state/bridge_state.dart';
import 'package:stitch/utilities/global_naming.dart';

class ProgressOverlay extends StatelessWidget {
  const ProgressOverlay({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    BridgeBase bridge = Provider.of<BridgeBase>(context);
    return SizedBox(
      height: 812.h,
      width: 375.w,
      child: Stack(
        children: [
          child,
          Visibility(
            visible: bridge.read(Naming.isInProgress, false).slice as bool,
            child: Container(
                height: 812.h,
                width: 375.w,
                color: Colors.white.withOpacity(.5),
                child: const Center(child: CircularProgressIndicator())),
          )
        ],
      ),
    );
  }
}
