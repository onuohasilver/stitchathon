import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stitch/data_layer/graph_ql.dart';
import 'package:stitch/global_components/custom_png.dart';
import 'package:stitch/global_components/custom_text.dart';
import 'package:stitch/modules/market/screens/checkout.dart';
import 'package:stitch/state/bridge_state/bridge_state.dart';
import 'package:stitch/state/route_state/route_methods.dart';
import 'package:stitch/utilities/box_sizing.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {Key? key,
      required this.src,
      required this.name,
      required this.price,
      required this.index})
      : super(key: key);
  final String src, name;
  final num price, index;

  @override
  Widget build(BuildContext context) {
    BridgeBase bridge = Provider.of<BridgeBase>(context);
    return GraphQLProvider(
      client: client,
      child: Material(
        child: InkWell(
          onTap: () async => {
            print('sss'),
            bridge.load('selected image', src, String),
            route(context).addToStack(const Checkout())
          },
          child: Container(
            decoration: BoxDecoration(
              color: getRandomColor().shade100,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 2,
                    color: Colors.grey.withOpacity(.1))
              ],
            ),
            height: 171.h,
            width: 164.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowPNG(src, height: 100),
                const YSpace(2),
                CustomText(name.substring(0, 10),
                    size: 14.sp, weight: FontWeight.w900),
                CustomText(price.toString(), size: 14.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

MaterialColor getRandomColor() {
  List<MaterialColor> colorlist = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange
  ];
  return colorlist[Random().nextInt(colorlist.length - 1)];
}
