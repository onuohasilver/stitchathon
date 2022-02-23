import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stitch/data_layer/jwt_serialize.dart';
import 'package:stitch/global_components/custom_flat_button.dart';
import 'package:stitch/global_components/custom_text.dart';
import 'package:stitch/global_components/custom_text_field.dart';
import 'package:stitch/modules/auth/data_layer/auth_bridge.dart';
import 'package:stitch/state/bridge_state/bridge_state.dart';
import 'package:stitch/state/route_state/route_map.dart';
import 'package:stitch/state/route_state/route_methods.dart';
import 'package:stitch/utilities/app_colors.dart';
import 'package:stitch/utilities/box_sizing.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    BridgeBase bridge = Provider.of<BridgeBase>(context);
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YSpace(124),
            CustomText('Sign in',
                size: 23.sp, weight: FontWeight.w700, color: AppColors.blue),
            const YSpace(24),
            CustomTextField(
              hint: 'Enter email',
              onChanged: (_) => bridge.load(AuthBridge.email, _, String),
            ),
            const YSpace(12),
            CustomTextField(
              hint: 'Enter password',
              obscure: true,
              onChanged: (_) => bridge.load(AuthBridge.email, _, String),
            ),
            const YSpace(12),
            const YSpace(15),
            CustomFlatButton(
              label: 'Sign In',
              onTap: () async {
                String pkey = await signJwt(privateKey);

                // print(pkey);

                route(context).addToStack(PageMap.market);
              },
            )
          ],
        ),
      ),
    );
  }
}
