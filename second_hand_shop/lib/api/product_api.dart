import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:mime/mime.dart';
import 'package:second_hand_shop/main.dart';
import 'package:second_hand_shop/model/Product.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../response/get_product_response.dart';
import '../utils/url.dart';
import 'httpservices.dart';

class ProductAPI {
  Future<bool> addProduct(File? file, Product products) async {
    try {
      var dio = HttpServices().getDioInstance();
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);

        image = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split("/").last,
          contentType: MediaType("image", mimeType!.split("/")[1]),
        );
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      products.owner_id = prefs.getString("id");
      var formData = FormData.fromMap({
        "name": products.name,
        "description": products.description,
        "image": image,
        "category": products.category,
        "price": products.price,
        "negotiation": products.negotiation,
        "availability": products.availability,
        "owner_id": products.owner_id,
        "delivery": products.delivery,
        "condition": products.condition,
        "usedFor": products.usedFor,
      });

      var response = await dio.post(productUrl,
          data: formData,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          }));
      print(response.statusCode);
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }

    return false;
  }

  Future<ProductResponse?> getProducts() async {
    Future.delayed(const Duration(seconds: 2), () {});
    ProductResponse? productResponse;
    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(getproductUrl);
      if (response.statusCode == 201) {
        productResponse = ProductResponse.fromJson(response.data);
        Hive.box(API_BOX).put("posts", response.data);
      } else {
        productResponse = null;
      }
    } catch (e) {
      print('no internet connection');
    }
    final posts = Hive.box(API_BOX).get('posts');
    if (posts.isNotEmpty) {
      productResponse = ProductResponse.fromJson(posts);
      return productResponse;
    }
    return productResponse;
  }
}
