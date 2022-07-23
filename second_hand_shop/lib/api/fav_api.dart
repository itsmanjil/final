import 'package:dio/dio.dart';
import 'package:second_hand_shop/api/httpservices.dart';
import 'package:second_hand_shop/model/fav.dart';

import '../utils/url.dart';

class Faveriots {
  Future addFav(String productid, String userid) async {
    var url = baseUrl + fav;
    var dio = HttpServices().getDioInstance();
    Response response;
    try {
      response = await dio.post(
        url,
        data: {"productid": productid, "userid": userid},
      );
      if (response.statusCode == 200) {
        return Fav.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
