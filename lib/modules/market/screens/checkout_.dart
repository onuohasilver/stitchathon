import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stitch/data_layer/graph_ql.dart';
import 'package:stitch/global_components/custom_flat_button.dart';
import 'package:stitch/global_components/custom_png.dart';
import 'package:stitch/global_components/custom_text.dart';
import 'package:stitch/state/bridge_state/bridge_state.dart';
import 'package:stitch/utilities/app_colors.dart';
import 'package:stitch/utilities/box_sizing.dart';
import 'package:url_launcher/url_launcher.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BridgeBase bridge = Provider.of<BridgeBase>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const YSpace(78),
          CustomText('Checkout',
              size: 23.sp, weight: FontWeight.w700, color: AppColors.blue),
          ShowPNG(
            bridge
                .read('selected image',
                    'https://m.media-amazon.com/images/I/31Ie69Q01JL._AC_.jpg')
                .slice,
            height: 400,
            width: double.infinity,
          ),
          const YSpace(34),
          CustomFlatButton(
            label: 'One Click Pay With Stitch',
            width: 200.w,
            onTap: () => client.value.query(
              ///QueryOptions(document: Node.DOCUMENT_NODE),
              ),
          )
        ],
      ),
    );
  }
}
