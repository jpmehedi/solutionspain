import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:solutionspain/core/values/app_color.dart';

class CustomButton extends StatelessWidget {
  final String buttonLevel;
  final Color?  color;
  final Color? textColor;
  final VoidCallback?  onPressed;
  final double? borderRadius;
  const CustomButton({
    Key? key, required this.buttonLevel, this.color, this.onPressed,this.textColor, this.borderRadius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: ElevatedButton(
          child: Text(
            buttonLevel,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.kWhiteColor, fontSize: 14)
          ),
          onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: color,
              textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.circular(borderRadius ?? 8)
              ),
            ),
          ),
      ),
    );
  }
}