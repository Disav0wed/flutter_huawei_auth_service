



import 'dart:developer';

import 'package:flutter/services.dart';

class AuthServiceHelper
{

  final MethodChannel _channel = MethodChannel("AuthServiceChannel");


  Future<String> requestVerificationCode(String email) async {
    String result = "";
    try {
      result = await _channel
          .invokeMethod("requestVerificationCode", {"email": email});
    } on PlatformException catch (e) {
      result = e.code;
      log(e.message + " Error code: " + e.code);
    }

    log("Result: "+ result);
    return result;
  }


  Future<String> registerWithEmail(String email,String password,String verificationCode) async {
    String result = "";
    try {
      result = await _channel
          .invokeMethod("registerWithEmail", {"email": email, "password": password, "verificationCode": verificationCode});
    } on PlatformException catch (e) {
      result = e.code;
      log(e.message + " Error code: " + e.code);
    }

    log("Result: "+ result);
    return result;
  }


  Future<String> login(String email,String password) async {
    String result = "";
    try {
      result = await _channel
          .invokeMethod("login", {"email": email, "password": password});
    } on PlatformException catch (e) {
      result = e.code;
      log(e.message + " Error code: " + e.code);
    }

    log("Result: "+ result);
    return result;
  }


}