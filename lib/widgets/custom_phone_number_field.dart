// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sizer/sizer.dart';
import 'package:solutionspain/core/values/app_color.dart';


class CustomPhoneNumberField extends StatelessWidget {
  final void Function(PhoneNumber)? onChanged;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final List<String>? country = ["BD", "IN","GB"];
  List<String>? countryIsoCode = ["BD","NG","PK","GB"];
  final void Function(PhoneNumber?)? onSaved;
  final void Function(Country)? onCountryChanged;
  final void Function(String)? onSubmitted;
  final bool? autofocus;
  final String? initialCountryCode;
  CustomPhoneNumberField({
    Key? key,
    this.onChanged,
    this.controller,
    this.suffixIcon,
    this.onSaved,
    this.onCountryChanged,
    this.onSubmitted,
    this.autofocus,
    this.countryIsoCode,
    this.initialCountryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      autofocus: autofocus ?? false,
      readOnly: false,
      controller: controller,
      initialCountryCode: initialCountryCode == null ? "BD" : initialCountryCode,
      onSaved: onSaved,
      onCountryChanged: onCountryChanged,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        LengthLimitingTextInputFormatter(10),
      ],
      disableLengthCheck:false,
      countries: countryIsoCode,
      dropdownIconPosition: IconPosition.trailing,
      dropdownIcon: Icon(Icons.arrow_drop_down,color: AppColor.kBlackColor,),
      flagsButtonPadding: EdgeInsets.only(left: 8),
      decoration: InputDecoration( 
        isDense: true,
        suffixIcon:suffixIcon,
        hintText: "Enter your phone".tr,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.kGreenColor,
          ),
        ),
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
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kGreyColor),
        ),
        contentPadding: EdgeInsets.all(0)
      ),
    );
  }
}