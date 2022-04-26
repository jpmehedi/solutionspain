// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    SignUpModel({
        this.phoneNumber,
        this.password,
        this.email,
        this.name,
        this.countryCode,
        this.otpNumberForEmail,
        this.otpNumberForPhone,
    });

    String? phoneNumber;
    String? password;
    String? email;
    String? name;
    String? countryCode;
    String? otpNumberForEmail;
    String? otpNumberForPhone;

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        email: json["email"],
        name: json["name"],
        countryCode: json["countryCode"],
        otpNumberForEmail: json["otpNumberForEmail"],
        otpNumberForPhone: json["otpNumberForPhone"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
        "email": email,
        "name": name,
        "countryCode": countryCode,
        "otpNumberForEmail": otpNumberForEmail,
        "otpNumberForPhone": otpNumberForPhone,
    };
}
