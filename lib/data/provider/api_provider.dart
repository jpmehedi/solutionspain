import 'dart:convert';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../core/utils/helpers.dart';
import '../../core/utils/log.dart';
class ApiProvider{

var client = http.Client();

Future getData(
  {
  required String baseUrl,
  required String url
  })async{
  try{
    EasyLoading.show( status: 'Loading...', maskType: EasyLoadingMaskType.black);
    var response = await client.get(Uri.parse("$baseUrl/$url"));
    EasyLoading.dismiss();
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      return jsonString;
    }else{
      var errorBody = jsonDecode(response.body);
      Helpers.showSnackBar(title: "Error", message: errorBody["message"]);
      return null;
    }
  } on SocketException catch (_) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: "noInternetConnection".tr);
  } on HttpException catch (error) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: error.message);
  } on FormatException catch (error) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: error.message);
  } catch (e) {
    EasyLoading.dismiss();
    Logger(key: "Unknown", value: "Unknown error");
  }

}

Future getSingleData(
  {
  required String baseUrl, 
  required String url, 
  required String id
  })async{
  
  try{
    EasyLoading.show( status: 'Loading...', maskType: EasyLoadingMaskType.black);
    var response = await client.get(Uri.parse("$baseUrl/$url/$id"));
    EasyLoading.dismiss();
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      return jsonString;
    }else{
      var errorBody = jsonDecode(response.body);
      Helpers.showSnackBar(title: "Error", message: errorBody["message"]);
      return null;
    }
  } on SocketException catch (_) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: "noInternetConnection".tr);
  } on HttpException catch (error) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: error.message);
  } on FormatException catch (error) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: error.message);
  } catch (e) {
    EasyLoading.dismiss();
    Logger(key: "Unknown", value: "Unknown error");
  }

}



Future postData(
  { 
    required String baseUrl, 
    required String url, 
    required Map<String, dynamic> data, 
    String? token
  })async{
  
  try{
    EasyLoading.show( status: 'Loading...', maskType: EasyLoadingMaskType.black);
    var response = await client.post(Uri.parse("$baseUrl/$url"), 
      headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data)
    );
    Logger(key: "response", value: response.request);
    EasyLoading.dismiss();

    if(response.statusCode == 200 || response.statusCode == 201){
      var jsonString = jsonDecode(response.body);
      Logger(key: "jsonString", value: jsonString);
      return jsonString;
    }else{
      var errorBody = jsonDecode(response.body);
      Helpers.showSnackBar(title: "Error", message: errorBody["message"]);
      return null;
    }

  } on SocketException catch (_) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: "noInternetConnection".tr);
  } on HttpException catch (error) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: error.message);
  } on FormatException catch (error) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: error.message);
  } catch (e) {
    EasyLoading.dismiss();
    Logger(key: "Unknown", value: "Unknown error");
  }

}


Future updateData(
  { 
  required String baseUrl, 
  required String url, 
  required Map<String, dynamic> data, 
  required String id, 
  String? token
  })async{

  try{
    EasyLoading.show( status: 'Loading...', maskType: EasyLoadingMaskType.black);
    var response = await client.put(Uri.parse("$baseUrl/$url/$id"),
        headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data)
    );
    EasyLoading.dismiss();

    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      return jsonString;
    }else{
      var errorBody = jsonDecode(response.body);
      Helpers.showSnackBar(title: "Error", message: errorBody["message"]);
      return null;
    }
  } on SocketException catch (_) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: "noInternetConnection".tr);
  } on HttpException catch (error) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: error.message);
  } on FormatException catch (error) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: error.message);
  } catch (e) {
    EasyLoading.dismiss();
    Logger(key: "Unknown", value: "Unknown error");
  }

}


Future deleteData(
  {
    required String baseUrl, 
    required  String url, 
    required String id
  })async{

  try{
    EasyLoading.show( status: 'Loading...', maskType: EasyLoadingMaskType.black);
    var response = await client.delete(Uri.parse("$baseUrl/$url/$id"));
    EasyLoading.dismiss();

    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      return jsonString;
    }else{
      var errorBody = jsonDecode(response.body);
      Helpers.showSnackBar(title: "Error", message: errorBody["message"]);
      return null;
    }
  } on SocketException catch (_) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: "noInternetConnection".tr);
  } on HttpException catch (error) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: error.message);
  } on FormatException catch (error) {
    EasyLoading.dismiss();
    Helpers.showSnackBar(title: "Error", message: error.message);
  } catch (e) {
    EasyLoading.dismiss();
    Logger(key: "Unknown", value: "Unknown error");
  }

}

}