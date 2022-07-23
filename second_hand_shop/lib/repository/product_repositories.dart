import 'dart:io';

import 'package:second_hand_shop/api/product_api.dart';
import 'package:second_hand_shop/model/Product.dart';

import '../response/get_product_response.dart';

class ProductRepository {
  Future<bool> addProduct(File? file, Product products) async {
    return ProductAPI().addProduct(file, products);
  }

  Future<ProductResponse?> getProducts() async {
    return ProductAPI().getProducts();
  }
}
