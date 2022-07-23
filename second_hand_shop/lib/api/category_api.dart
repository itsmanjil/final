import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/dropdown_category.dart';
import '../response/category_response.dart';
import '../utils/url.dart';
import 'httpservices.dart';

class CategoryAPI {
  Future<List<DropdownCategory?>> loadCategory() async {
    List<DropdownCategory?> dropdownCategoryList = [];
    Response response;
    var url = baseUrl + categoryUrl;
    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(url);

      if (response.statusCode == 201) {
        CategoryResponse categoryResponse =
            CategoryResponse.fromJson(response.data);

        for (var data in categoryResponse.data!) {
          dropdownCategoryList.add(
            DropdownCategory(
              id: data.id,
              name: data.name,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }

    return dropdownCategoryList;
  }
}
