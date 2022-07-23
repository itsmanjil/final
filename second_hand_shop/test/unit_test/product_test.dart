import 'package:flutter_test/flutter_test.dart';
import 'package:second_hand_shop/repository/product_repositories.dart';
import 'package:second_hand_shop/repository/userrepository.dart';
import 'package:second_hand_shop/response/get_product_response.dart';
import 'package:second_hand_shop/utils/url.dart';

void main() {
  late UserRepository? userRepository;
  late ProductResponse? productResponse;
  late ProductRepository? productRepository;
  setUp(() {
    userRepository = UserRepository();
    productRepository = ProductRepository();
    productResponse = ProductResponse();
    token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyYmFhYjJhNTNjZTMzNzNmNDA2MjNjZSIsImlhdCI6MTY1ODEzMjE0NywiZXhwIjoxNjU4MTY2NzA3fQ.-R3o5UFmX9DW3dSvqhjuzOqF23ORMp9iQxFM4NbsyPo";
  });

  group('get products from api', () {
    test('get products from api', () async {
      productResponse = await productRepository!.getProducts();
      bool expectedResult = true;
      bool actualResult = false;

      if (productResponse!.data!.isNotEmpty) {
        actualResult = true;
      }
      expect(expectedResult, actualResult);
    });
  });
}
