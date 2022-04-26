// To parse this JSON data, do
//
//     final sendOtpModel = sendOtpModelFromJson(jsonString);

import 'dart:convert';

SendOtpModel sendOtpModelFromJson(String str) => SendOtpModel.fromJson(json.decode(str));

String sendOtpModelToJson(SendOtpModel data) => json.encode(data.toJson());

class SendOtpModel {
    SendOtpModel({
        this.phoneNumber,
        this.password,
        this.email,
        this.name,
        this.countryCode,
    });

    String? phoneNumber;
    String? password;
    String? email;
    String? name;
    String? countryCode;

    factory SendOtpModel.fromJson(Map<String, dynamic> json) => SendOtpModel(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        email: json["email"],
        name: json["name"],
        countryCode: json["countryCode"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
        "email": email,
        "name": name,
        "countryCode": countryCode,
    };
}
