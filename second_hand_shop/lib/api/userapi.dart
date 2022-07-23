import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:second_hand_shop/api/httpservices.dart';
import 'package:second_hand_shop/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../response/loginResponse.dart';

class UserAPI {
  Future<bool> registerUser(User user) async {
    bool isLogin = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();
      var response =
          await dio.post(url, data: {"email": email, "password": password});
      if (response.data["message"] == "Invalid Login") {
        isLogin = false;
      } else {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        isLogin = true;
        final body = response.data;
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("login", body['token']);
        await pref.setString("id", body["logininfo"]['id']);

        // print(pref.getString("login"));
        // print(body["logininfo"]['id']);
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }
}
