import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stitch/global_components/custom_text.dart';
import 'package:stitch/utilities/app_colors.dart';
import 'package:stitch/utilities/box_sizing.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton(
      {Key? key,
      this.height = 48,
      this.width = 306,
      this.prefix,
      this.suffix,
      this.label,
      this.onTap,
      this.color = AppColors.blue})
      : super(key: key);
  final num height, width;
  final Color color;
  final Widget? prefix, suffix;
  final String? label;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    assert((suffix != null) || (label != null));
    return SizedBox(
      height: height.h,
      width: width.w,
      child: Material(
        borderRadius: BorderRadius.circular(8.sp),
        color: color,
        child: InkWell(
          onTap: onTap,
          child: prefix != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [prefix!, const XSpace(14), suffix!],
                )
              : Center(
                  child: CustomText(label!, size: 13.sp, color: Colors.white),
                ),
        ),
      ),
    );
  }
}
