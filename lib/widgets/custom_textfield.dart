import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/values/app_color.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String? level;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Key? fromkey;
  final String? hintText;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool readOnly;
  const CustomTextField({
    Key? key, this.keyboardType,
    this.level, 
    this.obscureText =  false, 
    this.suffixIcon, 
    this.controller,
    this.prefixIcon,
    this.fromkey,
    this.validator,
    this.autovalidateMode,
    this.inputFormatters,
    this.hintText,
    this.onTap,
    this.focusNode,
    this.readOnly = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      key: fromkey,
      validator: validator,
      readOnly: readOnly,
      // textInputAction: TextInputAction.next,
      autovalidateMode: autovalidateMode,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      onTap: onTap,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        suffixIcon: suffixIcon,
        prefixIcon:prefixIcon,
        label:  level != null ? Text(level!, style: TextStyle(color: AppColor.kGreyColor),):Text(''),
        errorStyle: TextStyle(
          color: AppColor.kSecondaryColor,
          fontSize: 10.sp,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kGreyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kGreyColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kSecondaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kGreenColor),
        ),
      ),
    );
  }
}