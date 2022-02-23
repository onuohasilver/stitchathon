import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stitch/global_components/fader.dart';

class ShowPNG extends StatelessWidget {
  const ShowPNG(
    this.src, {
    this.height = .1,
    this.width = 100,
    Key? key,
  }) : super(key: key);
  final String src;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Fader(
      child: SizedBox(
        width: width.w,
        height: height.h,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.sp),
            topRight: Radius.circular(6.sp),
          ),
          child: Image.network(
            src,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
