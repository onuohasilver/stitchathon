import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stitch/global_components/custom_text.dart';
import 'package:stitch/utilities/app_colors.dart';
import 'package:stitch/utilities/box_sizing.dart';

class CustomTextField extends StatelessWidget {
  final String hint, label;
  final Function(String)? onChanged;
  final bool obscure, pad;
  final double width, height;
  final Widget icon;
  final TextInputType? inputType;

  const CustomTextField(
      {Key? key,
      required this.hint,
      this.onChanged,
      this.inputType,
      this.obscure = false,
      this.pad = true,
      this.width = 306,
      this.height = 48,
      this.icon = const Icon(Icons.person),
      this.label = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: label.length > 1,
            child: CustomText(
              label,
              size: 12,
              weight: FontWeight.w400,
              color: const Color(0xFF444449),
            ),
          ),
          YSpace(4.h),
          SizedBox(
            width: width.w,
            height: height.h,
            child: TextField(
              style: const TextStyle(color: Colors.black),
              keyboardType: inputType,
              onChanged: onChanged,
              // textAlign: TextAlign.center,
              obscureText: obscure,
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.black, fontSize: 12.sp),
                  fillColor: AppColors.blue.withOpacity(.15),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.transparent))),
            ),
          ),
        ],
      ),
    );
  }
}
