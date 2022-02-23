import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stitch/data_layer/graph_ql.dart';
import 'package:stitch/global_components/custom_flat_button.dart';
import 'package:stitch/global_components/custom_text.dart';
import 'package:stitch/image_assets.dart';
import 'package:stitch/modules/market/artifacts/product_widget.dart';
import 'package:stitch/state/bridge_state/bridge_state.dart';
import 'package:stitch/utilities/app_colors.dart';
import 'package:stitch/utilities/box_sizing.dart';
import 'package:url_launcher/url_launcher.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    BridgeBase bridge = Provider.of<BridgeBase>(context);
    return GraphQLProvider(
      client: client,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YSpace(78),
                CustomText('Our Products',
                    size: 23.sp,
                    weight: FontWeight.w700,
                    color: AppColors.blue),
                const YSpace(24),
                Expanded(
                    child: SizedBox(
                  width: 300.w,
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 24.h),
                      itemBuilder: (context, index) {
                        return ProductWidget(
                          src: images[index]['image'],
                          name: images[index]['name'],
                          price: images[index]['price'],
                          index: index,
                        );
                      }),
                ))
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
